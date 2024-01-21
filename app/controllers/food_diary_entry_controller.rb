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
  end

  def update
  end

  def destroy
  end

  private

  def diary_entry_params
    params.require(:food_diary_entry).permit(:date)
  end

end
