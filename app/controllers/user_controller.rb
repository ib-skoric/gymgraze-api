class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:index, :show_profile_details, :confirm_email, :resend_confirmation_email]
  def index
    render json: @user, serializer: UserSerializer, status: :ok
  end

  def profile
    render json: @user, serializer: UserRegistrationSerializer, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.confirmation_email(@user).deliver_now
      @user.update(confirmation_sent_at: Time.now.utc)
      render json: @user, status: :created, serializer: UserRegistrationSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def confirm_email
    @user = User.find_by(confirmation_token: params[:confirmation_token])
    if @user && @user.confirmation_token_expires_at > Time.now.utc
      @user.update!(confirmation_token: nil, confirmed_at: Time.now.utc)
      render json: @user, status: :accepted, serializer: UserSerializer
    else
      render json: { error: "Invalid or expired confirmation token" }, status: :unauthorized
    end
  end

  def resend_confirmation_email
    user = User.find_by(email: params[:email])

    if user && user.confirmed_at.nil?
      user.regenerate_confirmation_token
      UserMailer.confirmation_email(user).deliver_now
      render json: { message: "Confirmation email resent" }, status: :accepted
    else
      render json: { error: "User not found or already confirmed" }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :weight, :height, :confirmation_token, :confirmed_at, :confirmation_sent_at, :confirmation_token_expires_at)
  end
end