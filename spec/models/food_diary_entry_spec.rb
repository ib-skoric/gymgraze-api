require 'rails_helper'

RSpec.describe FoodDiaryEntry, type: :model do
  describe 'it validates presence of required attributes' do
    it "should validate presence of date" do
      new_entry = FoodDiaryEntry.new(date: nil)

      expect(new_entry.valid?).to eq(false)
      expect(new_entry.errors[:date]).to eq(["can't be blank"])
    end

    it "should validate presence of user_id" do
      new_entry = FoodDiaryEntry.new(user_id: nil)

      expect(new_entry.valid?).to eq(false)
      expect(new_entry.errors[:user_id]).to eq(["is not a number"])
    end
  end

  it 'should have many meals' do
    association = described_class.reflect_on_association(:meals)
    expect(association.macro).to eq :has_many
  end

  it 'should have many foods' do
    association = described_class.reflect_on_association(:foods)
    expect(association.macro).to eq :has_many
  end
end
