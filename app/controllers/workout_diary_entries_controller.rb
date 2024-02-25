class WorkoutDiaryEntriesController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def create
    diary_entry = WorkoutDiaryEntry.new(diary_entry_params)

    diary_entry.user_id = @user.id

    if diary_entry.save
      render json: diary_entry, status: :created
    else
      render json: diary_entry.errors, status: :unprocessable_entity
    end
  end

  def show
    diary_entry = WorkoutDiaryEntry.find(params[:id])
    render json: diary_entry, status: :ok
  end

  private

  def diary_entry_params
    params.require(:workout_diary_entry).permit(:date)
  end
end
