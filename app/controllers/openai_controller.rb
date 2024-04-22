class OpenaiController < ApplicationController
  include ActionController::HttpAuthentication::Token
  before_action :authenticate_user

  OPENAI_API_KEY = ENV['OPENAI_API_KEY']

  def create
    render json: { api_key: OPENAI_API_KEY }, status: :ok
  end

end
