class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user

  def index
    render json: @user, serializer: UserSerializer
  end

  private

  # method that checks if the user is authenticated
  def authenticate_user
    token, _options = token_and_options(request)

    # if the token is nil, return an error as json
    if token.nil?
      render json: { error: 'Unauthorized' }, status: :unauthorized
      return
    end

    # otherwise decode the token
    user_id = AuthenticationService.decode(token)

    # and find the user
    @user = User.find(user_id)
  end
end