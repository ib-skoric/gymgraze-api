class ExerciseTypesController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    params = exercise_type_params
    params[:timer] = params[:timer].to_i
    @exercise_type = ExerciseType.new(params.merge(user_id: @user.id))
    if @exercise_type.save
      render json: @exercise_type, status: :created, serializer: ExerciseTypeSerializer
    else
      render json: @exercise_type.errors, status: :unprocessable_entity
    end
  end

  def index
    @exercise_types = ExerciseType.where(user_id: @user.id)
    render json: @exercise_types, status: :ok, each_serializer: ExerciseTypeSerializer
  end

  private def exercise_type_params
    params.require(:exercise_type).permit(:name, :exercise_category, :timer)
  end
end
