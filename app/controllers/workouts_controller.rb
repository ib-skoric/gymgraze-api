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

  def destroy
    workout = Workout.find_by!(id: params[:id], user_id: @user.id)
    exercises = Exercise.where(workout_id: workout.id)
    exercise_sets = ExerciseSet.where(workout_id: workout.id)

    exercises.each do |exercise|
          exercise.destroy!
    end

    exercise_sets.each do |exercise_set|
      exercise_set.destroy!
    end

    workout.destroy!
    head :no_content

  rescue ActiveRecord::RecordNotDestroyed
    render json: { error: 'Failed to destroy workout' }, status: :unprocessable_entity
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
    params.require(:workout).permit(:duration, :date, :workout_diary_entry_id)
  end
end
