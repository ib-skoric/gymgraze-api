class User < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 8 }

  # ------------ MODEL ASSOCIATIONS --------------- #
  has_one :goal
end
