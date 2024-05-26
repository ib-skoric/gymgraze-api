require 'rails_helper'

describe User, type: :model do

  context 'validates presence of attributes' do
    it "should have an email" do
      user_no_email = User.create(email: "", password: "password")
      expect(user_no_email).to_not be_valid
      expect(user_no_email.errors[:email]).to include("can't be blank")
    end

    it "should have a name" do
      user_no_name = User.create(email: "test@test.com", password: "password", name: "")
      expect(user_no_name).to_not be_valid
      expect(user_no_name.errors[:name]).to include("can't be blank")
    end

    it "should have an age" do
      user_no_age = User.create(email: "test@test.com", password: "password", name: "Jane", age: "")
      expect(user_no_age).to_not be_valid
      expect(user_no_age.errors[:age]).to include("can't be blank")
    end

    it "should have a weight" do
      user_no_weight = User.create(email: "test@test.com", password: "password", name: "Jane", age: "25", weight: "")
      expect(user_no_weight).to_not be_valid
      expect(user_no_weight.errors[:weight]).to include("can't be blank")
    end

    it "should have a height" do
      user_no_height = User.create(email: "test@test.com", password: "password", name: "Jane", age: "25", weight: "75", height: "")
      expect(user_no_height).to_not be_valid
      expect(user_no_height.errors[:height]).to include("can't be blank")
    end

    it "should have a password" do
      user_no_password = User.create(email: "peter.doe@test.com", password: "")
      expect(user_no_password).to_not be_valid
      expect(user_no_password.errors[:password]).to include("can't be blank")
    end

    it "should have a password with at least 8 characters" do
      user_short_password = User.create(email: "mark.doe@test.com", password: "abc")
      expect(user_short_password).to_not be_valid
      expect(user_short_password.errors[:password]).to include("is too short (minimum is 8 characters)")
    end
  end
end
