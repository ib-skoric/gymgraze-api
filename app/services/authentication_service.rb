class AuthenticationService

  HMAC_SECRET = ENV['HMAC_SECRET']
  ALGORITHM_TYPE = ENV['ALGORITHM_TYPE']
  def self.encode(user_id)

    payload = { user_id: user_id }

    token = JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE

    return token
  end

  def self.decode(token)
    decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
    return decoded_token[0]['user_id']
  end
end