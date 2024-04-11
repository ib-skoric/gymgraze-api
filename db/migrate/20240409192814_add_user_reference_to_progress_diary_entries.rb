class AddUserReferenceToProgressDiaryEntries < ActiveRecord::Migration[7.0]
  def change
    add_reference :progress_diary_entries, :user, null: false, foreign_key: true
  end
end
