class AuthenticationService
  def self.call
    hmac_secret = "my$ecretK3y"
    # The secret must be a string. With OpenSSL 3.0/openssl gem `<3.0.1`, JWT::DecodeError will be raised if it isn't provided.
    payload = { "test" => "test123" }

    token = JWT.encode payload, hmac_secret, 'HS256'

    return token
  end
end