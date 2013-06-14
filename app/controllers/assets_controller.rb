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
end
