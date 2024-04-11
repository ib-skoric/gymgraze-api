class MealsController < ApplicationController
  class AuthenticationError < StandardError; end
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:create, :update_all, :destroy]

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

  def update_all
    params[:meals].each do |meal_param|
      meal = Meal.find(meal_param[:id])
      meal.update(name: meal_param[:name])
    end

    @meals = Meal.find(params[:meals].map { |meal| meal[:id] })

    if @meals.all? { |meal| meal.valid? }
      render json: @meals, status: :accepted, each_serializer: MealSerializer
    else
      render json: @meals.map(&:errors), status: :unprocessable_entity
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    # find all foods that belong to this meal
    foods = Food.where(meal_id: @meal.id)
    # destroy each food
    foods.each do |food|
      food.destroy
    end

    @meal.destroy
    head :no_content
  end

  private

  def meal_params
    params.require(:meal).permit(:name)
  end
end
