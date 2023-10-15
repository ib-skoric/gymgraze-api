require 'rails_helper'
require 'spec_helper'

describe AuthenticationService do
  describe ".call" do
    it "should return an authentication token when called with valid credentials" do
      token = described_class.call(1)
      decoded_token = JWT.decode token, described_class::HMAC_SECRET, true, { algorithm: described_class::ALGORITHM_TYPE }

      expect(decoded_token).to eq([
                                    { "user_id" => 1 },
                                    { "alg" => "HS256" }
                                  ])
    end
  end
end