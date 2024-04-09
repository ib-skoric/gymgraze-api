class ProgressDiaryEntriesController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def create
    date = diary_entry_params[:date].to_date

    diary_entry = ProgressDiaryEntry.new(date: date, user_id: @user.id)

    if diary_entry.save
      render json: diary_entry, status: :created, serializer: ProgressDiaryEntrySerializer, include: ['progress_diary_entries']
    else
      render json: diary_entry.errors, status: :unprocessable_entity
    end
  end

  def fetch_by_date
    diary_entry = ProgressDiaryEntry.find_by!(date: params[:date], user_id: @user.id)
    render json: diary_entry, status: :ok, serializer: ProgressDiaryEntrySerializer
  end

  private

  def diary_entry_params
    params.require(:progress_diary_entry).permit(:date, :weight, :arm_measurement, :waist_measurement, :hip_measurements, :chest_measurement)
  end

end
