require 'rails_helper'

RSpec.describe WorkoutTemplate, type: :model do
  it 'should have many template exercises' do
    template = WorkoutTemplate.reflect_on_association(:template_exercises)
    expect(template.macro).to eq(:has_many)
  end

  it 'should have many exercises' do
    template = WorkoutTemplate.reflect_on_association(:exercise_types)
    expect(template.macro).to eq(:has_many)
  end

  it 'should belong to a user' do
    template = WorkoutTemplate.reflect_on_association(:user)
    expect(template.macro).to eq(:belongs_to)
  end
end
