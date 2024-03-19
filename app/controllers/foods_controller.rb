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
    food = Food.new(food_params)
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
    params.require(:food).permit(:name, :barcode, :kcal, :protein, :carbs, :fat, :salt, :sugar, :fibre, :meal_id, :food_diary_entry_id, :amount)
  end

  def record_not_found(e)
    render json: { error: e.message }, status: :not_found
  end
end
