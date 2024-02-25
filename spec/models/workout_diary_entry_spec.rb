require 'rails_helper'

RSpec.describe WorkoutDiaryEntry, type: :model do
  it "should validate presence of date" do
    no_date_entry = WorkoutDiaryEntry.create(date: nil)

    expect(no_date_entry).to_not be_valid
    expect(no_date_entry.errors[:date]).to include("can't be blank")
  end

  it "should validate presence of user_id" do
    no_user_id_entry = WorkoutDiaryEntry.create(user_id: nil)

    expect(no_user_id_entry).to_not be_valid
    expect(no_user_id_entry.errors[:user_id]).to include("can't be blank")
  end

  it "should validate uniqueness of date scoped to user_id" do
    user = FactoryBot.build(:jane_doe)
    first_entry = FactoryBot.create(:workout_diary_entry, user_id: user.id, date: Date.today)
    second_entry = FactoryBot.build(:workout_diary_entry, user_id: user.id, date: Date.today)

    expect(second_entry).to_not be_valid
    expect(second_entry.errors[:date]).to include("has already been taken")
  end
end
