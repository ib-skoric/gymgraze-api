class ExercisesController < ApplicationController

  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    @exercise = Exercise.new(exercise_params.merge(user_id: @user.id))

    if @exercise.save
      render json: @exercise, status: :created, serializer: ExerciseSerializer
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  def show
    @exercise = Exercise.find(params[:id])
    render json: @exercise, status: :ok, serializer: ExerciseSerializer
  end

  def index
    @exercises = Exercise.where(user_id: @user.id, workout_id: nil)
    render json: @exercises, status: :ok, each_serializer: ExerciseSerializer
  end

  private

  def exercise_params
    params.require(:exercise).permit(:name, :exercise_type, :workout_id, :calories_burned, :duration, :date, :user_id)
  end
end
