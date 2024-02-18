class RemoveUnusedFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :token_expiry
    remove_column :users, :refresh_token
    remove_column :users, :refresh_token_expiry_at
  end
end
