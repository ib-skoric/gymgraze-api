class ExerciseTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :exercise_category, :historical_set_rep_data

  def historical_set_rep_data
    # find last instance of this exercise type used for exercise
    last_exercise = Exercise.where(exercise_type_id: object.id).last

    unless object.exercise_category == "cardio" || last_exercise.nil?
    # Then find all exercise sets that belong to this exercise
    exercise_sets = ExerciseSet.where(exercise_id: last_exercise.id)
    end

    if exercise_sets
      exercise_sets.map do |exercise_set|
        {
          reps: exercise_set.reps,
          weight: exercise_set.weight,
          created_at: exercise_set.created_at
        }
      end
    else
      []
    end
  end
end
