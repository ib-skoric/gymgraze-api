class AddFoodToNutritionalInfo < ActiveRecord::Migration[7.0]
  def change
    add_reference :nutritional_infos, :food, null: false, foreign_key: true
  end
end
