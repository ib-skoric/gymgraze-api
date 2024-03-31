class ChangeAmountInFoodToDecimal < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :amount, :decimal
  end
end
