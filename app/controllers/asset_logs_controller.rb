class AssetLogsController < ApplicationController
  def index
    @asset_logs = AssetLog.all
  end
end
