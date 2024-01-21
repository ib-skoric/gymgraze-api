class FoodDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date, :created_at, :updated_at

  # ------------ RELATIONSHIPS ------------
  # return every food diary entry's food object
  has_many :foods, serializer: FoodSerializer
end
