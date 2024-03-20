class FoodDiaryEntriesController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: FoodDiaryEntry.includes(foods: :nutritional_info).where(user_id: @user.id), include: ['foods.nutritional_info']
  end

  def fetch_by_date
    render json: FoodDiaryEntry.includes(foods: [:nutritional_info, :meal]).find_by!(date: params[:date]), include: ['foods.nutritional_info', 'foods.meal']
  end

  def create
    date = diary_entry_params[:date].to_date

    diary_entry = FoodDiaryEntry.new(date: date)

    diary_entry.user_id = @user.id

    if diary_entry.save
      render json: diary_entry, status: :created
    else
      render json: diary_entry.errors, status: :unprocessable_entity
    end
  end

  private

  def diary_entry_params
    params.require(:food_diary_entry).permit(:date)
  end

end
