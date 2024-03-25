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

  private

  def workout_params
    params.require(:workout).permit(:date, :workout_diary_entry_id)
  end
end
