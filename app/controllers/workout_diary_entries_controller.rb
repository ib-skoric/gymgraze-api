class WorkoutDiaryEntriesController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def create
    date = diary_entry_params[:date].to_date

    diary_entry = WorkoutDiaryEntry.new(date: date, user_id: @user.id)

    if diary_entry.save
      render json: diary_entry, status: :created, serializer: WorkoutDiaryEntrySerializer, include: ['workouts']
    else
      render json: diary_entry.errors, status: :unprocessable_entity
    end
  end

  def show
    diary_entry = WorkoutDiaryEntry.find(params[:id]).includes(:workouts, workouts: :exercises)
    render json: diary_entry, status: :ok, serializer: WorkoutDiaryEntrySerializer, include: ['workouts', 'workouts.exercises']
  end

  def fetch_by_date
    diary_entry = WorkoutDiaryEntry.includes(:workouts).includes(:workouts, workouts: :exercises).find_by!(date: params[:date], user_id: @user.id)
    render json: diary_entry, status: :ok, serializer: WorkoutDiaryEntrySerializer, include: ['workouts', 'workouts.exercises']
  end

  private

  def diary_entry_params
    params.require(:workout_diary_entry).permit(:date)
  end
end
