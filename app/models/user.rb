class User < ApplicationRecord
  after_create :generate_confirmation_token
  after_create :create_default_exercise_types
  after_create :create_default_meals

  # ------------ MODEL VALIDATIONS ---------------- #
  has_secure_password
  validates :email, presence: true, uniqueness: true, length: { minimum: 5 }, on: :create
  validates :password, presence: true, length: { minimum: 8 }, on: :create
  validates :name, presence: true, length: { minimum: 2 }, on: :create
  validates :age, presence: true, on: :create
  validates :weight, presence: true, on: :create
  validates :height, presence: true, on: :create

  # ------------ MODEL ASSOCIATIONS --------------- #
  has_one :goal, dependent: :destroy
  has_many :meals, dependent: :destroy
  has_many :exercise_types, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :exercises, dependent: :destroy
  has_many :workout_templates, dependent: :destroy
  has_many :food_diary_entries, dependent: :destroy
  has_many :workout_diary_entries, dependent: :destroy
  has_many :progress_diary_entries, dependent: :destroy

  def is_same_as?(user)
    if self.id == user.id
      true
    else
      false
    end
  end

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

  def create_default_exercise_types
    ExerciseType.create(name: "Barbell squat", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Bench press", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Shoulder press", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Dead lift", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Bicep curls", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Lat pull down", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Chest fly", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Barbell row", user_id: self.id, exercise_category: "strength", timer: 60)
    ExerciseType.create(name: "Running", user_id: self.id, exercise_category: "cardio", timer: 60)
    ExerciseType.create(name: "Walking", user_id: self.id, exercise_category: "cardio", timer: 60)
    ExerciseType.create(name: "Jogging", user_id: self.id, exercise_category: "cardio", timer: 60)
    ExerciseType.create(name: "HIIT", user_id: self.id, exercise_category: "cardio", timer: 60)
  end

  def create_default_meals
    Meal.create(name: "Breakfast", user_id: self.id)
    Meal.create(name: "Lunch", user_id: self.id)
    Meal.create(name: "Dinner", user_id: self.id)
    Meal.create(name: "Snacks", user_id: self.id)
  end
end
