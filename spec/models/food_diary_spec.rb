require 'rails_helper'

RSpec.describe FoodDiary, type: :model do
  describe "ensures that a food diary belongs to a user" do
    it "should belong to a user" do
      user = User.create!(username: "testuser", password: "testpassword")
      food_diary = FoodDiary.create!(user_id: user.id)

      expect(food_diary.user).to eq(user)
      expect { food_diary.user }.to_not raise_error
    end

    it "should raise an error if it does not belong to a user" do
      food_diary = FoodDiary.create(user_id: nil)

      # expect food not to be created if user id is nil
      expect(food_diary).to_not be_valid
      expect(food_diary.errors[:user_id]).to include("can't be blank")
    end
    end
end
