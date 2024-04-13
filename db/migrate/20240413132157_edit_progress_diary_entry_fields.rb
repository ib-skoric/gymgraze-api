class EditProgressDiaryEntryFields < ActiveRecord::Migration[7.0]
  def change
    remove_column :progress_diary_entries, :hip_measurement, :float

    # add body fat percentage to progress diary entries
    add_column :progress_diary_entries, :body_fat_percentage, :float
  end
end
