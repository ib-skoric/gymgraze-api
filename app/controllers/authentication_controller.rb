class AuthenticationController < ApplicationController
  # define a new error class
  class AuthenticationError < StandardError; end

  # ----------- RESCUE FROM -------------
  rescue_from AuthenticationError, with: :unauthorized_request
  rescue_from ActionController::ParameterMissing, with: :param_missing
  def create
    # check that the request includes username + password
    user_params

    # look up the user
    user = User.find_by(username: params[:username])

    raise AuthenticationError unless user.authenticate(params[:password])

    # generate token using authentication service
    token = AuthenticationService.call(user.id)

    # return token
    render json: { token: token }, status: :created
  end

  private

  # method for strong params when sending user info
  def user_params
    params.require([:username, :password])
  end

  # method used to raise error when params are missing
  def param_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def unauthorized_request()
    render json: { error: "Invalid credentials" }, status: :unauthorized
  end
end