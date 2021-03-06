class Admin::AssetsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if current_user.admin?
      @assets = Asset.all
    else
      redirect_to assets_path
    end
  end

  def show
    @asset = Asset.find(params[:id])
    @asset_logs = AssetLog.fetch_all_for_asset(@asset)

    set_qrcode
  end

  def new
    @asset = Asset.new
  end

  def create
    AssetLog.logging_action_for current_user, params[:action] do |l|
      @asset = Asset.create(params[:asset])
      l.record_asset @asset

      redirect_to admin_asset_path(@asset)
    end
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])

    if params[:asset][:borrower_id]
      params[:asset][:status] = "borrowed"
      @asset.borrower = User.find(params[:asset][:borrower_id].to_i)
    else
      params[:asset][:status] = "available"
    end
    @asset.update_attributes(params[:asset])

    redirect_to admin_asset_path(@asset)
  end

  def qrcode
    @assets = {}
    params['label'].keys.each do |i|
      @assets[i] = Asset.find(params[:label][i])
    end

    render template: "assets/qrcode", layout: false
  end

  def borrowed_status
    @asset = Asset.find_by_uuid(params[:uuid])
  end

  def borrow
    AssetLog.logging_action_for current_user, params[:action] do |l|
      @asset = Asset.find(params[:id])
      l.record_asset @asset

      @asset.borrow_for(current_user)

      redirect_to admin_asset_path @asset
    end
  end

  def return
    AssetLog.logging_action_for current_user, params[:action] do |l|
      @asset = Asset.find(params[:id])
      l.record_asset @asset

      @asset.return

      redirect_to admin_asset_path @asset
    end
  end

  def set_qrcode
    url = view_context.borrow_asset_url(@asset)
    @qr = RQRCode::QRCode.new(url)
  end
end
