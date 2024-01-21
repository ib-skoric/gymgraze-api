class FoodDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :created_at, :updated_at
end
