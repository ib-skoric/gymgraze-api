# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_27_181326) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_sets", force: :cascade do |t|
    t.integer "reps"
    t.decimal "weight"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "workout_id", null: false
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["workout_id"], name: "index_exercise_sets_on_workout_id"
  end

  create_table "exercise_types", force: :cascade do |t|
    t.string "name"
    t.string "exercise_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.integer "timer"
    t.index ["user_id"], name: "index_exercise_types_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "workout_id"
    t.string "type"
    t.bigint "exercise_type_id", null: false
    t.string "name"
    t.string "exercise_category"
    t.integer "duration"
    t.index ["exercise_type_id"], name: "index_exercises_on_exercise_type_id"
    t.index ["user_id"], name: "index_exercises_on_user_id"
    t.index ["workout_id"], name: "index_exercises_on_workout_id"
  end

  create_table "food_diary_entries", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_diary_entries_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "barcode"
    t.bigint "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_diary_entry_id"
    t.decimal "amount"
    t.index ["food_diary_entry_id"], name: "index_foods_on_food_diary_entry_id"
    t.index ["meal_id"], name: "index_foods_on_meal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "steps"
    t.integer "kcal"
    t.integer "exercise"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "nutritional_infos", force: :cascade do |t|
    t.decimal "kcal"
    t.decimal "carbs"
    t.decimal "fat"
    t.decimal "protein"
    t.decimal "salt"
    t.decimal "sugar"
    t.decimal "fiber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_id", null: false
    t.index ["food_id"], name: "index_nutritional_infos_on_food_id"
  end

  create_table "progress_diary_entries", force: :cascade do |t|
    t.date "date"
    t.decimal "weight"
    t.decimal "arm_measurement"
    t.decimal "waist_measurement"
    t.decimal "chest_measurement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.float "body_fat_percentage"
    t.index ["user_id"], name: "index_progress_diary_entries_on_user_id"
  end

  create_table "template_exercises", force: :cascade do |t|
    t.bigint "workout_template_id", null: false
    t.bigint "exercise_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "exercise_category"
    t.index ["exercise_type_id"], name: "index_template_exercises_on_exercise_type_id"
    t.index ["workout_template_id"], name: "index_template_exercises_on_workout_template_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "age"
    t.decimal "weight"
    t.integer "height"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "confirmation_token_expires_at"
  end

  create_table "workout_diary_entries", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workout_diary_entries_on_user_id"
  end

  create_table "workout_templates", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workout_templates_on_user_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.date "date"
    t.bigint "workout_diary_entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "calories_burned"
    t.bigint "user_id", null: false
    t.integer "duration"
    t.index ["user_id"], name: "index_workouts_on_user_id"
    t.index ["workout_diary_entry_id"], name: "index_workouts_on_workout_diary_entry_id"
  end

  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "workouts", on_delete: :cascade
  add_foreign_key "exercise_types", "users"
  add_foreign_key "exercises", "exercise_types"
  add_foreign_key "exercises", "users"
  add_foreign_key "exercises", "workouts", on_delete: :cascade
  add_foreign_key "food_diary_entries", "users"
  add_foreign_key "foods", "food_diary_entries"
  add_foreign_key "foods", "meals"
  add_foreign_key "goals", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "nutritional_infos", "foods"
  add_foreign_key "progress_diary_entries", "users"
  add_foreign_key "template_exercises", "exercise_types"
  add_foreign_key "template_exercises", "workout_templates"
  add_foreign_key "workout_diary_entries", "users"
  add_foreign_key "workout_templates", "users"
  add_foreign_key "workouts", "users"
  add_foreign_key "workouts", "workout_diary_entries"
end
