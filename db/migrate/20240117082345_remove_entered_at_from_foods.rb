class RemoveEnteredAtFromFoods < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :entered_at, :datetime
  end
end
