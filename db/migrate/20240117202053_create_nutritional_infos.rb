class CreateNutritionalInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :nutritional_infos do |t|
      t.decimal :kcal
      t.decimal :carbs
      t.decimal :fat
      t.decimal :protein
      t.decimal :salt
      t.decimal :sugar
      t.decimal :fiber

      t.timestamps
    end
  end
end
