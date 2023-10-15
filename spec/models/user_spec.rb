require 'rails_helper'

describe User, type: :model do

  context "Check if user can be created," do
    it "should create a new user" do
      unique_user = User.create(username: "super_unique_user", password: "supersecret123")
      expect(unique_user).to be_valid
    end
  end

  context "Check if user data is valid," do

    it "checks if username is blank" do
      user_no_username = User.create(username: "", password: "supersecret123")
      expect(user_no_username).to_not be_valid
      expect(user_no_username.errors[:username]).to include("can't be blank")
    end

    it "should have a username with at least 5 characters" do
      user_short_username = User.create(username: "abc", password: "supersecret123")
      expect(user_short_username).to_not be_valid
      expect(user_short_username.errors[:username]).to include("is too short (minimum is 5 characters)")
    end

    it "should have an unique username" do
      user_duplicate_username = User.create(username: "john.doe", password: "supersecret123")
      expect(user_duplicate_username).to_not be_valid
      expect(user_duplicate_username.errors[:username]).to include("has already been taken")
    end

    it "should have a password" do
      user_no_password = User.create(username: "peter.doe", password: "")
      expect(user_no_password).to_not be_valid
      expect(user_no_password.errors[:password]).to include("can't be blank")
    end

    it "should have a password with at least 8 characters" do
      user_short_password = User.create(username: "mark.doe", password: "abc")
      expect(user_short_password).to_not be_valid
      expect(user_short_password.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
  end

end
