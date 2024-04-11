class UserController < ApplicationController
  class AuthenticationError < StandardError; end
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:index, :profile, :confirm_email, :resend_confirmation_email, :update]

  # ----------- RESCUE FROM -------------
  rescue_from AuthenticationError, with: :unauthorized_request
  rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :unauthorized_request
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
    @user = User.find_by(email: params[:email])
    if @user
      UserMailer.reset_password(@user).deliver_now
      render json: { message: "Password reset email sent" }, status: :accepted
    else
      render json: { message: "User with that email was not found" }, status: :not_found
    end
  end

  def validate_password_reset_token
    user = User.find_signed!(params[:token], purpose: 'password_reset')

    if user
      render json: { message: "Token valid" }, status: :accepted
    else
      raise AuthenticationError
    end
  end

  def reset_password
    user = User.find_signed!(params[:token], purpose: 'password_reset')

    if user.update(password_reset_params)
      render json: { message: "Password reset successfully" }, status: :accepted
    else
      raise AuthenticationError
    end
  end

  def check_email_exists
    user = User.find_by(email: params[:email])
    if user
      render json: { message: "User with this email already exists" }, status: :conflict
    else
      render json: { message: "Email is not in use yet" }, status: :ok
    end
  end

  def update
    if @user.update(update_user_params)
      render json: @user, status: :accepted, serializer: UserRegistrationSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :age, :weight, :height, :confirmation_token, :confirmed_at, :confirmation_sent_at, :confirmation_token_expires_at)
  end

  def update_user_params
    params.require(:user).permit(:name, :age, :weight, :height)
  end

  def password_reset_params
    params.require(:user).permit(:password)
  end

  def unauthorized_request
    render json: { error: "Invalid credentials" }, status: :unauthorized
  end
end