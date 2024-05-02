require 'rails_helper'

RSpec.describe ExerciseSet, type: :model do

  before(:all) do
    @user = FactoryBot.build(:jane_doe)
    @workout_diary_entry = FactoryBot.create(:workout_diary_entry, user_id: @user.id)
    @workout = FactoryBot.create(:workout, user_id: @user.id, workout_diary_entry_id: @workout_diary_entry.id)
    @exercise = FactoryBot.create(:exercise, workout_id: @workout.id)
  end

  it "should have a valid number of reps" do
    exercise_set = ExerciseSet.new(reps: nil)
    expect(exercise_set).to_not be_valid

    expect(exercise_set.errors[:reps]).to include("can't be blank")
  end

  it "should have a valid weight" do
    exercise_set = ExerciseSet.new(weight: nil)
    expect(exercise_set).to_not be_valid

    expect(exercise_set.errors[:weight]).to include("can't be blank")
  end

  it "should get created with a valid workout ID" do
    exercise_set = ExerciseSet.new(workout_id: @workout.id, reps: 5, weight: 100, exercise_id: @exercise.id)
    expect(exercise_set).to be_valid

  end

  it "should have reps, weight, and exercise_id present when created" do
    exercise_set = ExerciseSet.new(reps: 5, weight: 100, exercise_id: @exercise.id, workout_id: @workout.id)
    expect(exercise_set).to be_valid
  end
end
