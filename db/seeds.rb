# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create!(email: "superuser", password: "superuser", name: "Ivan", age: 25, weight: 75, height: 180)
Goal.create!(steps: 10000, kcal: 2000, exercise: 30, user_id: 1)
Meal.create!(name: "Breakfast", user_id: 3)
Meal.create!(name: "Lunch", user_id: 3)
Meal.create!(name: "Dinner", user_id: 3)
FoodDiaryEntry.create!(date: "2024-03-18", user_id: 1)
Food.create!(name: "Apple", barcode: 3560071269999, food_diary_entry_id: 3, meal_id: 1)
Food.create!(name: "Apple", barcode: 3560071269999, food_diary_entry_id: 3, meal_id: 2)
NutritionalInfo.create!(kcal: 95, protein: 0.5, fat: 0.3, carbs: 25, fiber: 4.4, sugar: 19, food_id: 2)
Food.create!(name: "Cider", barcode: 3560071269999, food_diary_entry_id: 2, meal_id: 1)
NutritionalInfo.create!(kcal: 195, protein: 25, fat: 43, carbs: 25, fiber: 4.4, sugar: 19, food_id: 3)
WorkoutDiaryEntry.create!(date: Date.today, user_id: 1)
Workout.create!(date: Date.today, workout_diary_entry_id: 1, user_id: 1)
Exercise.create!(name: "Running", exercise_type: "cardio", user_id: 3)
Exercise.create!(name: "Bench press", exercise_type: "strength", user_id: 3)
Exercise.create!(name: "Shoulder press", exercise_type: "strength", user_id: 3)
Exercise.create!(name: "Barbell squat", exercise_type: "strength", user_id: 3)