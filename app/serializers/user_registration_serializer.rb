class UserRegistrationSerializer < ActiveModel::Serializer

  # ------------ ATTRIBUTES ------------
  attributes :id, :email, :name, :age, :weight, :height, :confirmed_at

  def confirmed_at
    object.confirmed_at.to_i
  end
end
