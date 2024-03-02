class UserController < ApplicationController
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:index, :profile, :confirm_email, :resend_confirmation_email, :request_password_reset]

  # ----------- RESCUE FROM -------------
  rescue_from AuthenticationError, with: :unauthorized_request
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
      @user.update(confirmation_sent_at: Time.now.to_i)
      render json: @user, status: :created, serializer: UserRegistrationSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def confirm_email
    user_by_confirmation_token = User.find_by(confirmation_token: params[:confirmation_token])
    if @user && @user.confirmation_token_expires_at > Time.now && @user.is_same_as?(user_by_confirmation_token)
      @user.update!(confirmation_token: nil, confirmed_at: Time.now)
      render json: @user, status: :accepted, serializer: UserRegistrationSerializer
    else
      render json: { error: "Invalid or expired confirmation token" }, status: :unauthorized
    end
  end

  def resend_confirmation_email
    if @user && @user.confirmed_at.nil?
      @user.regenerate_confirmation_token
      UserMailer.confirmation_email(@user).deliver_now
      render json: { message: "Confirmation email resent" }, status: :accepted
    else
      render json: { error: "User not found or already confirmed" }, status: :not_found
    end
  end

  def request_password_reset
    raise AuthenticationError unless @user

    UserMailer.password_reset_email(@user).deliver_now
    render json: { message: "Password reset email sent" }, status: :accepted
  end

  def reset_password
    user = User.find_signed!(params[:token], purpose: 'password_reset')

    if user.update(password_reset_params)
      render json: { message: "Password reset successfully" }, status: :accepted
    else
      raise AuthenticationError
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :weight, :height, :confirmation_token, :confirmed_at, :confirmation_sent_at, :confirmation_token_expires_at)
  end

  def password_reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def unauthorized_request
    render json: { error: "Invalid credentials" }, status: :unauthorized
  end
end