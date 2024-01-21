class RemoveNullRequirementFromFood < ActiveRecord::Migration[7.0]
  def change
    change_column_null :foods, :nutritional_info_id, true
    change_column_null :foods, :food_diary_entry_id, true
  end
end
