class AddFieldsToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :notes, :text
    add_column :assets, :shared_resource, :boolean, null: false, default: false
  end
end
