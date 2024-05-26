require 'rails_helper'

RSpec.describe ProgressDiaryEntry, type: :model do
  it 'validates presence of date' do
    progress_diary_entry = ProgressDiaryEntry.new(date: nil)
    expect(progress_diary_entry).to_not be_valid
    expect(progress_diary_entry.errors.messages[:date]).to include("can't be blank")
  end

  it 'is valid when all attributes are present' do
    progress_diary_entry = ProgressDiaryEntry.new(date: Date.today, user_id: FactoryBot.create(:user).id)
    expect(progress_diary_entry).to be_valid
  end
end
