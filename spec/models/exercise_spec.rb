require 'rails_helper'

RSpec.describe Exercise, type: :model do
  it "should validate presence of name" do
    no_name_exercise = Exercise.new(name: nil)

    expect(no_name_exercise).to_not be_valid
    expect(no_name_exercise.errors[:name]).to include("can't be blank")
  end

  it "should validate presence of duration" do
    no_duration_exercise = Exercise.new(duration: nil)

    expect(no_duration_exercise).to_not be_valid
    expect(no_duration_exercise.errors[:duration]).to include("can't be blank")
  end

  it "should validate present of type" do
    no_type_exercise = Exercise.new(type: nil)

    expect(no_type_exercise).to_not be_valid
    expect(no_type_exercise.errors[:type]).to include("can't be blank")
  end
end
