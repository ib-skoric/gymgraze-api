class WorkoutTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at

  # find all the exercises that belong to the workout template
  has_many :template_exercises, serializer: TemplateExerciseSerializer
end
