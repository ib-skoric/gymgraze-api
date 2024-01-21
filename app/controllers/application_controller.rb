class ApplicationController < ActionController::API
  def authenticate_user
    token, _options = token_and_options(request)

    # if the token is nil, return an error as json
    if token.nil?
      render json: { error: 'Unauthorized' }, status: :unauthorized
      return
    end

    # otherwise decode the token
    user_id = AuthenticationService.decode(token)

    # and find the user
    @user = User.find(user_id)
  end
end
