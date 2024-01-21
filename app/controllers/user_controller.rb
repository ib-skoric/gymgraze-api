class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: @user, serializer: UserSerializer
  end

  private
end