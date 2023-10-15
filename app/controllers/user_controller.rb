class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: { user_id: @user.id }
  end

  private

  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthenticationService.decode(token)

    @user = User.find(user_id)
  end
end