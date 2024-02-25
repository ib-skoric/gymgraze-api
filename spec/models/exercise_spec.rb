require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it "should validate presence of name" do
    no_name_exercise = Exercise.new(name: nil)

    expect(no_name_exercise).to_not be_valid
    expect(no_name_exercise.errors[:name]).to include("can't be blank")
  end

  it "should validate present of type" do
    no_type_exercise = Exercise.new(exercise_type: nil)

    expect(no_type_exercise).to_not be_valid
    expect(no_type_exercise.errors[:exercise_type]).to include("can't be blank")
  end

  it "should validate inclusion of type" do
    invalid_type_exercise = Exercise.new(exercise_type: "something else")

    expect(invalid_type_exercise).to_not be_valid
    expect(invalid_type_exercise.errors[:exercise_type]).to include("is not included in the list")
  end
end
