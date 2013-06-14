module AssetsHelper
  def borrow_asset_url(asset)
    short_url([assets_url, asset.uuid, "borrowed_status"].join('/'))
  end
end
