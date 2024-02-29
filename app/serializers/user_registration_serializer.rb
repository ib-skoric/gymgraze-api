class UserRegistrationSerializer < ActiveModel::Serializer

  # ------------ ATTRIBUTES ------------
  attributes :id, :email, :name, :age, :weight, :height, :confirmed_at.to_s
end
