class AuthenticationController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :param_missing
  def create
    user_params

    user = User.find_by(username: params.require(:username))
    token = AuthenticationService.call(user.id)

    render json: { token: token }, status: :created
  end

  private

  def user_params
    params.require([:username, :password])
  end

  def param_missing(e)
    render json: { error: e.message }, status: :unprocessable_entity
  end
end