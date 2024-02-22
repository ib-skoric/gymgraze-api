class ExerciseDiaryEntriesController < ApplicationController
  include ActionController::HttpAuthentication::Token

  def create
    diary_entry = ExerciseDiaryEntry.new(diary_entry_params)

    diary_entry.user_id = @user.id

    if diary_entry.save
      render json: diary_entry, status: :created
    else
      render json: diary_entry.errors, status: :unprocessable_entity
    end
  end

  private

  def diary_entry_params
    params.require(:exercise_diary_entry).permit(:date, :duration, :exercise_id)
  end
end
