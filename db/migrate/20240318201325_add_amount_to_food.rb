class AddAmountToFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :amount, :integer
  end
end
