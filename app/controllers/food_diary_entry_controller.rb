class FoodDiaryEntryController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: FoodDiaryEntry.includes(foods: :nutritional_info).where(user_id: @user.id), include: ['foods.nutritional_info']
  end

  def show
    render json: FoodDiaryEntry.includes(foods: :nutritional_info).find(params[:id]), include: ['foods.nutritional_info']
  end

  def create
    diary_entry = FoodDiaryEntry.new(diary_entry_params)

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
