class FoodsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  # ----------- RESCUE FROM -------------
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
    raise ActiveRecord::RecordNotFound unless food = Food.find(params[:id])

    render json: food, status: :ok, serializer: FoodSerializer
  end

  def create
    food_diary_entry_id = diary_date(params[:diary_date])
    food = Food.new(food_params.merge(food_diary_entry_id: food_diary_entry_id))
    if food.save
      render json: food, status: :created, serializer: FoodSerializer
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  def update
    food = Food.find(params[:id])
    if food.update(food_params)
      render json: food, status: :ok, serializer: FoodSerializer
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy
    render json: { message: "Food deleted successfully" }, status: :ok
  end

  private

  def food_params
    params.require(:food).permit(:name, :barcode, :meal_id, :food_diary_entry_id, :amount, :diary_date, nutritional_info_attributes: [:kcal, :protein, :fat, :carbs, :salt, :sugar, :fiber])
  end

  def record_not_found(e)
    render json: { error: e.message }, status: :not_found
  end

  def diary_date(date)
    diary = FoodDiaryEntry.find_by(date: date.to_date)

    diary.id if diary
  end
end
