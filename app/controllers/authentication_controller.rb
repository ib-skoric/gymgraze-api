class AuthenticationController < ApplicationController
  def create
    render json: { token: 'abc123' }, status: :created
  end
end