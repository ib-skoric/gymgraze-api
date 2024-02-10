class User < ApplicationRecord
  # ------------ MODEL VALIDATIONS ---------------- #
  has_secure_password
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :password, presence: true, length: { minimum: 8 }
  validates :name, presence: true, length: { minimum: 2 }
  validates :age, presence: true
  validates :weight, presence: true

  # ------------ MODEL ASSOCIATIONS --------------- #
  has_one :goal
  has_many :meals
end
