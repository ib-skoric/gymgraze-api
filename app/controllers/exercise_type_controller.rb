class ExerciseTypeController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    @exercise_type = ExerciseType.new(exercise_type_params.merge(user_id: @user.id))
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
end
