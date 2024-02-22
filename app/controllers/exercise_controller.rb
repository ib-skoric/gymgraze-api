class ExerciseController < ApplicationController

  def new
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :exercise_type)
  end
end
