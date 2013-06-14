class ChangeAssetUserIdToBorrowedId < ActiveRecord::Migration
  def change
    rename_column :assets, :user_id, :borrower_id
    add_column :assets, :borrower_type, :string
  end
end
