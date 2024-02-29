require 'rails_helper'

RSpec.describe ExerciseSet, type: :model do

  let(:exercise) { FactoryBot.create(:exercise) }

  it "should have a valid number of reps" do
    exercise_set = ExerciseSet.new(reps: 0)
    expect(exercise_set).to_not be_valid

    expect(exercise_set.errors[:reps]).to include("must be greater than 0")
  end

  it "should have a valid weight" do
    exercise_set = ExerciseSet.new(weight: nil)
    expect(exercise_set).to_not be_valid

    expect(exercise_set.errors[:weight]).to include("can't be blank")
  end

  it "should have a valid exercise_id" do
    exercise_set = ExerciseSet.new(exercise_id: nil)
    expect(exercise_set).to_not be_valid

    expect(exercise_set.errors[:exercise_id]).to include("can't be blank")
  end

  it "should have reps, weight, and exercise_id present when created" do
    exercise_set = ExerciseSet.new(reps: 5, weight: 100, exercise_id: exercise.id)
    expect(exercise_set).to be_valid
  end
end
