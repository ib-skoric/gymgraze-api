class AuthenticationService
  HMAC_SECRET = "my$ecretK3y"
  ALGORITHM_TYPE = 'HS256'
  def self.call

    # The secret must be a string. With OpenSSL 3.0/openssl gem `<3.0.1`, JWT::DecodeError will be raised if it isn't provided.
    payload = { "test" => "test123" }

    token = JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE

    return token
  end
end