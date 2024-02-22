require 'rails_helper'

RSpec.describe ExerciseDiaryEntry, type: :model do
  it "should validate presence of date" do
    no_date_entry = ExerciseDiaryEntry.create(date: nil)

    expect(no_date_entry).to_not be_valid
    expect(no_date_entry.errors[:name]).to include("can't be blank")
  end

  it "should validate presence of user_id" do
    no_user_id_entry = ExerciseDiaryEntry.create(user_id: nil)

    expect(no_user_id_entry).to_not be_valid
    expect(no_user_id_entry.errors[:user_id]).to include("can't be blank")
  end

  it "should validate presence of calories_burned" do
    no_exercise_id_entry = ExerciseDiaryEntry.create(calories_burned: nil)

    expect(no_exercise_id_entry).to_not be_valid
    expect(no_exercise_id_entry.errors[:calories_burned]).to include("can't be blank")
  end
end
