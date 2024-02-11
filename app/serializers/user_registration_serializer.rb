class UserRegistrationSerializer < ActiveModel::Serializer

  # ------------ ATTRIBUTES ------------
  attributes :id, :email, :name, :age, :weight, :height
end
