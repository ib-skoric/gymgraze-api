require 'rails_helper'

RSpec.describe TemplateExercise, type: :model do
  it 'belongs to a workout template' do
    template_exercise = TemplateExercise.new
    expect(template_exercise).to respond_to(:workout_template)
  end

  it 'belongs to an exercise type' do
    template_exercise = TemplateExercise.new
    expect(template_exercise).to respond_to(:exercise_type)
  end
end
