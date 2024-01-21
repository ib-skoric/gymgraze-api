class FoodDiaryEntryController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: FoodDiaryEntry.where(user_id: @user.id), each_serializer: FoodDiaryEntrySerializer
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

end
