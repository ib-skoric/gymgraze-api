class CreateProgressDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :progress_diary_entries do |t|
      t.date :date
      t.decimal :weight
      t.decimal :hip_measurement
      t.decimal :arm_measurement
      t.decimal :waist_measurement
      t.decimal :chest_measurement

      t.timestamps
    end
  end
end
