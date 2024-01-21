require 'spec_helper'

def authentication_helper(user)
  # generate token using authentication service
  token = AuthenticationService.encode(user.id)

  # return token
  { 'Authorization': "Bearer #{token}" }
end