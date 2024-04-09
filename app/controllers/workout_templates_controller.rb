class WorkoutTemplatesController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  def create
    workout_template = WorkoutTemplate.new(workout_template_params.merge(user_id: @user.id))

    if workout_template.save
      render json: workout_template, status: :created, serializer: WorkoutTemplateSerializer
    else
      render json: { errors: workout_template.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    workout_templates = WorkoutTemplate.where(user_id: @user.id)
    render json: workout_templates, status: :ok, each_serializer: WorkoutTemplateSerializer
  end

  private

  def workout_template_params
    params.require(:workout_template).permit(:name, template_exercises_attributes: [:id, :exercise_type_id, :exercise_category])
  end
end
