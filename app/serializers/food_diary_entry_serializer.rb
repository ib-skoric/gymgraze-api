class FoodDiaryEntrySerializer < ActiveModel::Serializer
  attributes :id, :date

  # ------------ RELATIONSHIPS ------------
  # return every food diary entry's food object
  has_many :foods, serializer: FoodSerializer

  def date
    object.date.to_i
  end
end
