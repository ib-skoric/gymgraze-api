class User < ApplicationRecord
  before_create :generate_confirmation_token

  # ------------ MODEL VALIDATIONS ---------------- #
  has_secure_password
  validates :email, presence: true, uniqueness: true, length: { minimum: 5 }, on: create
  validates :password, presence: true, length: { minimum: 8 }, on: create
  validates :name, presence: true, length: { minimum: 2 }, on: create
  validates :age, presence: true, on: create
  validates :weight, presence: true, on: create
  validates :height, presence: true, on: create

  # ------------ MODEL ASSOCIATIONS --------------- #
  has_one :goal
  has_many :meals

  private

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64(15)
    self.confirmation_token_expires_at = Time.now.utc + 1.hours
  end

  def regenerate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64(15)
    self.confirmation_token_expires_at = Time.now.utc + 1.hours
    self.confirmation_sent_at = Time.now.utc
    save!
  end

  def is_same_as?(user)
    if self.id == user.id
       true
    else
       false
    end
  end
end
