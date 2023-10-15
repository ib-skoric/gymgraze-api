class UsersController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token



  before_action :authenticate_user

  def show
    @user = User.find(params[:id])
    render json: { user: "Hello world" }
  end

  private

  def authenticate_user
    token, _options = token_and_options(request)
    user_id = AuthenticationService.decode(token)

    raise user_id.inspect
  end
end