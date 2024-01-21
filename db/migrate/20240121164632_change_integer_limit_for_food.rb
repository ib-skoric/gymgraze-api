class ChangeIntegerLimitForFood < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :barcode, :integer, limit: 8
  end
end
