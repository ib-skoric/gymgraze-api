# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "superuser", password: "coolbeans")

Goal.create(user_id: 1, calories: 2000, protein: 100, carbs: 100, fat: 100)

Meal.create(user_id: 1, name: "Breakfast")
Meal.create(user_id: 1, name: "Lunch")

Food.create(name: "Egg", calories: 70, protein: 6, carbs: 0, fat: 5)
Food.create(name: "Bacon", calories: 43, protein: 3, carbs: 0, fat: 3)
Food.create(name: "Toast", calories: 75, protein: 3, carbs: 13, fat: 1)

FoodDiaryEntry.create(date: "2021-09-01", user_id: 1)