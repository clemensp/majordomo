class AssetsController < ApplicationController
  def index
    @assets = Asset.all
  end

  def show
    @asset = Asset.find(params[:id])
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
end
