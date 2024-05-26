require 'rails_helper'

RSpec.describe ExerciseType, type: :model do
  describe 'it validates presence of required attributes' do
  it 'validates presence of name' do
    exercise_type = ExerciseType.new(name: nil)
    expect(exercise_type).to be_invalid
  end

  it 'validates presence of exercise_category' do
    exercise_type = ExerciseType.new(exercise_category: nil)
    expect(exercise_type).to be_invalid
  end
  end

  it 'validates inclusion of exercise_category' do
    exercise_type = ExerciseType.new(exercise_category: 'yoga')
    expect(exercise_type).to be_invalid
  end

  it 'is created when all attributes are valid' do
    exercise_type = ExerciseType.new(name: 'Squats', exercise_category: 'strength')
    expect(exercise_type).to be_valid
  end

  it 'has many exercises' do
    exercise_type = ExerciseType.reflect_on_association(:exercises)
    expect(exercise_type.macro).to eq(:has_many)
  end
end
