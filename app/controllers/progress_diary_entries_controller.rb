class ProgressDiaryEntriesController < ApplicationController
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def create
    date = diary_entry_params[:date].to_date

    diary_entry = ProgressDiaryEntry.new(date: date, user_id: @user.id, weight: diary_entry_params[:weight], arm_measurement: diary_entry_params[:arm_measurement], waist_measurement: diary_entry_params[:waist_measurement], body_fat_percentage: diary_entry_params[:body_fat_percentage], chest_measurement: diary_entry_params[:chest_measurement])

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

  def destroy
    diary_entry = ProgressDiaryEntry.find_by!(id: params[:id], user_id: @user.id)
    diary_entry.destroy
    head :no_content
  end

  private

  def diary_entry_params
    params.require(:progress_diary_entry).permit(:date, :weight, :arm_measurement, :waist_measurement, :body_fat_percentage, :chest_measurement)
  end

end
