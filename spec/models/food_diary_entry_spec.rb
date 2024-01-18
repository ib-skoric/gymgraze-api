require 'rails_helper'

RSpec.describe FoodDiaryEntry, type: :model do
  describe 'it validates presence of required attributes' do
    it "should validate presence of date" do
      new_entry = FoodDiaryEntry.new(date: nil)

      expect(new_entry.valid?).to eq(false)
      expect(new_entry.errors[:date]).to eq(["can't be blank"])
    end
  end
end
