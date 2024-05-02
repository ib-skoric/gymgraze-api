require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it "should validate presence of user_id" do
    no_name_exercise = Exercise.new(user_id: nil)

    expect(no_name_exercise).to_not be_valid
    expect(no_name_exercise.errors[:user_id]).to include("can't be blank")
  end

  it "should validate present of type" do
    no_type_exercise = Exercise.new(exercise_type: nil)

    expect(no_type_exercise).to_not be_valid
    expect(no_type_exercise.errors[:exercise_type]).to include("must exist")
  end
end
