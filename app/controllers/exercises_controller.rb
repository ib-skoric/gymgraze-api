class ExercisesController < ApplicationController

  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    @exercises = []
    exercise_params[:exercises].each do |exercise|
      @exercise = Exercise.new(exercise.merge(user_id: @user.id))
      if @exercise.save
        @exercises << @exercise
      else
        render json: @exercise.errors, status: :unprocessable_entity
        return
      end
    end
    render json: @exercises, status: :created, each_serializer: ExerciseSerializer
  end

  def show
    @exercise = Exercise.includes(:exercise_sets).find(params[:id])
    render json: @exercise, status: :ok, serializer: ExerciseSerializer, include: ['exercise_sets']
  end

  def index
    @exercises = Exercise.where(user_id: @user.id, workout_id: nil)
    render json: @exercises, status: :ok, each_serializer: ExerciseSerializer
  end

  private

  def exercise_params
    params.permit(exercises: [:exercise_type_id, :workout_id, exercise_sets_attributes: [:reps, :weight, :workout_id]])
  end
end
