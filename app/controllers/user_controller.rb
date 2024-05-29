class UserController < ApplicationController
  class AuthenticationError < StandardError; end
  # used to get the token from the request header
  include ActionController::HttpAuthentication::Token

  before_action :authenticate_user, only: [:index, :profile, :confirm_email, :resend_confirmation_email, :update, :kcal_summary, :macros_summary, :destroy]

  # ----------- RESCUE FROM -------------
  rescue_from AuthenticationError, with: :unauthorized_request
  rescue_from ActiveSupport::MessageVerifier::InvalidSignature, with: :unauthorized_request
  def index
    render json: @user, serializer: UserSerializer, status: :ok
  end

  def profile
    render json: @user, serializer: UserRegistrationSerializer, status: :ok
  end

  def kcal_summary
    kcal = 0

    # get the food diary entry for today
    food_diary_entry_id = FoodDiaryEntry.find_by(date: date_param, user_id: @user.id).id

    # find all meals that belong to this entry
    foods = Food.where(food_diary_entry_id: food_diary_entry_id)

    # find all nutritional infos that belong to the foods
    nutritional_infos = NutritionalInfo.where(food_id: foods.map(&:id))

    # calculate the total kcal
    nutritional_infos.each do |nutritional_info|
      kcal += (nutritional_info.kcal / 100) * foods.find { |food| food.id == nutritional_info.food_id }.amount
    end

    render json: { kcal: kcal.to_f }, status: :ok
  end

  def macros_summary
    protein = 0
    carbs = 0
    fat = 0

    # get the food diary entry for today
    food_diary_entry_id = FoodDiaryEntry.find_by(date: date_param, user_id: @user.id).id

    # find all meals that belong to this entry
    foods = Food.where(food_diary_entry_id: food_diary_entry_id)

    # find all nutritional infos that belong to the foods
    nutritional_infos = NutritionalInfo.where(food_id: foods.map(&:id))

    # calculate the total macros
    nutritional_infos.each do |nutritional_info|
      protein += (nutritional_info.protein / 100) * foods.find { |food| food.id == nutritional_info.food_id }.amount
      carbs += (nutritional_info.carbs / 100) * foods.find { |food| food.id == nutritional_info.food_id }.amount
      fat += (nutritional_info.fat / 100) * foods.find { |food| food.id == nutritional_info.food_id }.amount
    end

    render json: { protein: protein.to_f, carbs: carbs.to_f, fat: fat.to_f }, status: :ok
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
      render json: @user, status: :accepted, serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy!
    render json: { message: "User deleted" }, status: :accepted
    else
      render json: { error: "User could not be deleted" }, status: :unprocessable_entity
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

  def date_param
    if params[:date].nil?
      Date.today
      else
    params[:date].to_date
    end
  end
end