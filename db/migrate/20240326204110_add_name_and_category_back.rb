class AddNameAndCategoryBack < ActiveRecord::Migration[7.0]
  def change
    add_column :exercises, :name, :string
    add_column :exercises, :exercise_category, :string
  end
end
