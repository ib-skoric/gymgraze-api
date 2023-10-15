require 'rails_helper'
require 'spec_helper'

describe AuthenticationService do
  describe ".call" do
    it "should return an authentication token when called with valid credentials" do
      hmac_secret = "my$ecretK3y"
      token = described_class.call
      decoded_token = JWT.decode token, hmac_secret, true, { algorithm: 'HS256' }

      expect(decoded_token).to eq([
                                    { "test" => "test123" },
                                    { "alg" => "HS256" }
                                  ])
    end
  end
end