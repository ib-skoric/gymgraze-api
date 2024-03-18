class ChangeBarcodeToString < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :barcode, :string
  end
end
