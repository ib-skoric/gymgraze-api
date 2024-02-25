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

ActiveRecord::Schema[7.0].define(version: 2024_02_25_113707) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_diary_entries", force: :cascade do |t|
    t.date "date"
    t.bigint "user_id", null: false
    t.integer "calories_burned"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_id"
    t.index ["exercise_id"], name: "index_exercise_diary_entries_on_exercise_id"
    t.index ["user_id"], name: "index_exercise_diary_entries_on_user_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.string "exercise_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_diaries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_food_diaries_on_user_id"
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
    t.bigint "barcode"
    t.bigint "meal_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "food_diary_entry_id"
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

  add_foreign_key "exercise_diary_entries", "exercises"
  add_foreign_key "exercise_diary_entries", "users"
  add_foreign_key "food_diaries", "users"
  add_foreign_key "food_diary_entries", "users"
  add_foreign_key "foods", "food_diary_entries"
  add_foreign_key "foods", "meals"
  add_foreign_key "goals", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "nutritional_infos", "foods"
end
