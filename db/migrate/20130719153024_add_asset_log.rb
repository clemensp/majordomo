class AddAssetLog < ActiveRecord::Migration
  def up
    create_table :asset_logs do |t|
      t.string :action
      t.references :asset
      t.references :user

      t.timestamps
    end
  end

  def down
    drop_table :asset_logs
  end
end
