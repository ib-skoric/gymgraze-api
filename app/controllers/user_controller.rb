class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:index]
  def index

    render json: @user, serializer: UserSerializer
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created, serializer: UserRegistrationSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :weight, :height)
  end
end