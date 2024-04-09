class MealsController < ApplicationController
  class AuthenticationError < StandardError; end
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:create, :update, :destroy]

  def create
    @meal = Meal.new(meal_params.merge(user_id: @user.id))
    if @meal.save
      render json: @meal, status: :created, serializer: MealSerializer
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def update
    @meal = Meal.find(params[:id])
    if @meal.update(meal_params)
      render json: @meal, status: :ok, serializer: MealSerializer
    else
      render json: @meal.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    head :no_content
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
