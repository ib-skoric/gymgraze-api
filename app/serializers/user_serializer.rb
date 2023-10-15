class UserSerializer < ActiveModel::Serializer
  attributes :id

  has_one :goal
end
