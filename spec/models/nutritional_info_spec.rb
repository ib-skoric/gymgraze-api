require 'rails_helper'

RSpec.describe NutritionalInfo, type: :model do
  describe "validates presence of attributes" do
    it "should validate presence of calories" do
      no_calories_nutritional_info = NutritionalInfo.new(kcal: nil)

      expect(no_calories_nutritional_info).to_not be_valid
      expect(no_calories_nutritional_info.errors[:kcal]).to include("can't be blank")
    end

    it "must have a food associated with it" do
      no_food_nutritional_info = NutritionalInfo.new(food: nil)

      expect(no_food_nutritional_info).to_not be_valid
      expect(no_food_nutritional_info.errors[:food]).to include("must exist")
    end

  end
end
