class TemplateExerciseSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_category, :exercise_type_id, :timer, :historical_set_rep_data

  belongs_to :exercise_type

  def timer
    object.exercise_type.timer
  end

  def name
    object.exercise_type.name
  end

  def historical_set_rep_data
    # find last instance of this exercise type used for exercise
    last_exercise = Exercise.where(exercise_type_id: object.exercise_type_id).last

    if last_exercise
      exercise_sets = ExerciseSet.where(exercise_id: last_exercise.id)
    else
      return
    end

    if exercise_sets
      exercise_sets.map do |exercise_set|
        {
          reps: exercise_set.reps,
          weight: exercise_set.weight
        }
      end
    else
      []
    end
  end

end
