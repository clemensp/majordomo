class AddStatusToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :status, :string, default: "available"
  end
end
