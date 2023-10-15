require 'spec_helper'

describe "Authentication" do
  describe "POST to /authenticate endpoint" do
    it "will authenticate the user" do
      post '/authenticate'
    end
  end

end