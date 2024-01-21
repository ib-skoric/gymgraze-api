class ChangeSchemaForNutritionalInfo < ActiveRecord::Migration[7.0]
  def change
    remove_column :foods, :nutritional_info_id
  end
end
