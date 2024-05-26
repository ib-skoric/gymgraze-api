class AuthenticationController < ApplicationController
  # define a new error class
  class AuthenticationError < StandardError; end

  # ----------- RESCUE FROM -------------
  rescue_from AuthenticationError, with: :unauthorized_request
  rescue_from ActionController::ParameterMissing, with: :param_missing
  def create
    # check that the request includes email + password
    user_params

    raise AuthenticationError unless user
    raise AuthenticationError unless user.authenticate(params[:password])

    # generate token using authentication service
    token = AuthenticationService.encode(user.id)

    # return token
    render json: { token: token }, status: :ok
  end

  private

  def user
    @user ||= User.find_by(email: params[:email])
  end

  # method for strong params when sending user info
  def user_params
    params.require([:email, :password])
  end

  # method used to raise error when params are missing
  def param_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def unauthorized_request
    render json: { error: "Invalid credentials" }, status: :unauthorized
  end
end