class ExerciseSetController < ApplicationController
  def index
    @exercise_sets = ExerciseSet.where(exercise_id: params[:exercise_id])

    render json: @exercise_sets, status: :ok, each_serializer: ExerciseSetSerializer
  end

  def show
    @exercise_set = ExerciseSet.find(params[:id])

    render json: @exercise_set, status: :ok, serializer: ExerciseSetSerializer
  end

  private

  def exercise_set_params
    params.require(:exercise_set).permit(:name, :description)
  end
end
