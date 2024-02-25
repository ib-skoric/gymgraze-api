class FoodsController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def show
    render json: Food.find(params[:id]), status: :ok
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food, status: :created
    else
      render json: food.errors, status: :unprocessable_entity
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :calories, :protein, :carbs, :fat, :salt, :sugar, :fibre)
  end
end
