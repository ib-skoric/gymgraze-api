require 'rails_helper'
require 'spec_helper'

describe AuthenticationService do
  describe ".call" do
    it "should return an authentication token when called with valid credentials" do
      expect(described_class.call).to eq("abc123")
    end

  end
end