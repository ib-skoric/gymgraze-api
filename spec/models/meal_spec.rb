require 'rails_helper'

describe Meal, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'validates presence of attributes' do
    it "should have a title" do
      meal = Meal.create(name: nil, user: user)

      expect(meal).to_not be_valid
      expect(meal.errors[:name]).to include("can't be blank")
    end
  end
end
