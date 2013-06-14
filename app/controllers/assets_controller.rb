class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])

    set_qrcode
  end

  def new
    @asset = Asset.new
  end

  def create
    @asset = Asset.create(params[:asset])

    redirect_to asset_path(@asset)
  end

  def edit
    @asset = Asset.find(params[:id])
  end

  def update
    @asset = Asset.find(params[:id])

    @asset.update_attributes(params[:asset])

    redirect_to asset_path(@asset)
  end

  def qrcode
    @asset = Asset.find(params[:id])
    set_qrcode

    render 'qrcode', layout: 'print'
  end

  def borrowed_status
    @asset = Asset.find_by_uuid(params[:uuid])
  end

  def borrow
    @asset = Asset.find(params[:id])
    @asset.borrow_for(params[:asset][:borrower_id])

    redirect_to :action => :borrowed_status, uuid: @asset.uuid
  end

  def return
    @asset = Asset.find(params[:id])
    @asset.return

    redirect_to :action => :borrowed_status, uuid: @asset.uuid
  end

  def set_qrcode
    url = view_context.borrow_asset_url(@asset)
    @qr = RQRCode::QRCode.new(url)
  end
end
