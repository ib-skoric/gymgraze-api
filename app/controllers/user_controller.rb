class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  def index
    before_action :authenticate_user

    render json: @user, serializer: UserSerializer
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :weight)
  end
end