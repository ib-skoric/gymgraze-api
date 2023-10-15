require 'rails_helper'

describe User, type: :model do

  context "Check if user can be created" do
    it "should create a new user" do
      valid_user = FactoryBot.create(:user, username: "john.doe", password: "supersecret")
      expect(valid_user).to be_valid
    end
  end

  context "Check if user data is valid" do

    it "should have a username" do
      user_no_username = FactoryBot.create(:user, username: "", password: "anothersecret123")
      expect(user_no_username).to_not be_valid
    end

    it "should have a username with at least 5 characters" do
      user_short_username = FactoryBot.create(:user, username: "abc", password: "anothersecret5678")
      expect(user_short_username).to_not be_valid
    end

    it "should have an unique username" do
      user_duplicate_username = FactoryBot.create(:user, username: "john.doe", password: "anothersecret")
      expect(user_duplicate_username).to_not be_valid
    end

    it "should have a password" do
      user_no_password = FactoryBot.create(:user, username: "jane.doe", password: "")
      expect(user_no_password).to_not be_valid
    end

    it "should have a password with at least 8 characters" do
      user_short_password = FactoryBot.create(:user, username: "jane.doe", password: "short")
      expect(user_short_password).to_not be_valid
    end
  end

end
