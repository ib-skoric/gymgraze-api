require 'rails_helper'

RSpec.describe Workout, type: :model do
  context 'validates presence of date and workout_diary_entry_id' do
    it 'should validate presence of date' do
      workout = Workout.new(date: nil, workout_diary_entry_id: 1)
      expect(workout).to_not be_valid
    end

    it 'should validate presence of workout_diary_entry_id' do
      workout = Workout.new(date: Date.today, workout_diary_entry_id: nil)
      expect(workout).to_not be_valid
    end

    it 'should validate presence of date and workout_diary_entry_id' do
      workout = Workout.new(date: nil, workout_diary_entry_id: nil)
      expect(workout).to_not be_valid
    end
  end

  it 'should be created as valid when all attributes are present' do
    user = FactoryBot.build(:jane_doe)
    workout = Workout.new(date: Date.today, workout_diary_entry_id: 1, user: user)
    expect(workout).to be_valid
  end
end
