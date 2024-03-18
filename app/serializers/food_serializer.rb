class FoodSerializer < ActiveModel::Serializer
  attributes :id, :barcode, :name

  # ------------ RELATIONSHIPS ------------
  has_one :nutritional_info, serializer: NutritionalInfoSerializer

  has_one :meal, serializer: MealSerializer
end
