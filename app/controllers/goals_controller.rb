class GoalsController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: %i[create index update_goal]

  def create
    @goal = Goal.new(goal_params.merge(user_id: @user.id))
    if @goal.save
      render json: @goal, status: :created, serializer:GoalSerializer
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  def index
    render json: Goal.where(user_id: @user.id), status: :ok
  end

  def update_goal
    @goal = Goal.where(user_id: @user.id)

    if @goal.update(goal_params)
      render json: @goal, status: :ok
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:steps, :kcal, :exercise, :user_id, :id)
  end
end
