class WorkoutsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    workout = Workout.new(workout_params.merge(user_id: @user.id))

    if workout.save
      render json: workout, status: :created, serializer: WorkoutSerializer
    else
       render json: { errors: workout.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    workout = Workout.includes(:exercises, exercises: :exercise_sets).find(params[:id])
    render json: workout, status: :ok, serializer: WorkoutSerializer, include: ['exercises', 'exercises.exercise_sets']
  end

  def add_exercises
    workout = Workout.find(params[:id])
    exercises = []
    params[:exercises].each do |exercise|
      exercises << Exercise.new(exercise.merge(workout_id: workout.id, user_id: @user.id))
    end

    if Exercise.import(exercises)
      render json: workout, status: :ok, serializer: WorkoutSerializer, include: ['exercises', 'exercises.exercise_sets']
    else
      render json: { errors: exercises.map(&:errors).map(&:full_messages) }, status: :unprocessable_entity
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:date, :workout_diary_entry_id, :duration)
  end
end
