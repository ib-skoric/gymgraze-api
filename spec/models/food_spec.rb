require 'rails_helper'

RSpec.describe Food, type: :model do
  describe "validation of attribute presence" do
    it "should validate presence of name" do
      no_name_food = Food.new(name: nil)

      expect(no_name_food).to_not be_valid
      expect(no_name_food.errors[:name]).to include("can't be blank")
    end

    it "should validate presence of barcode" do
      no_barcode_food = Food.new(barcode: nil)

      expect(no_barcode_food).to_not be_valid
      expect(no_barcode_food.errors[:barcode]).to include("can't be blank")
    end

    it "should validate presence of meal" do
      no_meal_food = Food.new(meal: nil)

      expect(no_meal_food).to_not be_valid
      expect(no_meal_food.errors[:meal]).to include("must exist")
    end
    end

  describe "it validates correct data types are used for each" do
    it "should return an error if barcode is not an integer" do
      food = Food.new(name: "Banana", barcode: "abc", meal: FactoryBot.create(:meal))

      expect(food).to_not be_valid
      expect(food.errors[:barcode]).to include("is not a number")
    end
  end
end
