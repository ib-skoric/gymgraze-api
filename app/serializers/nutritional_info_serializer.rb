class NutritionalInfoSerializer < ActiveModel::Serializer
  attributes :id, :kcal, :carbs, :protein, :fat
end
