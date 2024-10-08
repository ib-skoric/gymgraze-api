Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/authenticate', to: 'authentication#create'
  resources :user, only: [:show, :index, :create, :destroy]
  get "/profile" => "user#profile"
  get "/food_summary" => "user#kcal_summary"
  get "/macros_summary" => "user#macros_summary"
  put "/update_profile" => "user#update"

  post '/confirm_email', to: 'user#confirm_email'
  post '/resend_confirmation_email', to: 'user#resend_confirmation_email'

  post '/request_password_reset', to: 'user#request_password_reset'
  post '/validate_password_reset_token', to: 'user#validate_password_reset_token'
  post '/reset_password', to: 'user#reset_password'

  post '/check_email_exists', to: 'user#check_email_exists'

  get '/openai', to: 'openai#create'

  resources :exercises, only: [:create, :show, :index]
  resources :workout_diary_entries, only: [:create]
  resources :workouts, only: [:create, :show, :destroy]
  resources :foods, only: [:create, :show, :update, :destroy]
  resources :exercise_set, only: [:index, :show, :create]
  resources :goals, only: [:create, :index]
  resources :exercise_types, only: [:create, :index, :update]
  resources :workout_templates, only: [:create, :index, :destroy]
  resources :meals, only: [:create, :destroy]

  post '/update_all_meals', to: 'meals#update_all'

  put '/update_goal', to: 'goals#update_goal'

  resources :food_diary_entries, only: [:index, :create, :update, :destroy]

  resources :trends, only: [:index]

  get '/food_diary_entries/:date', to: 'food_diary_entries#fetch_by_date', as: 'food_diary_by_date'
  get '/workout_diary_entries/:date', to: 'workout_diary_entries#fetch_by_date', as: 'workout_diary_by_date'
  get '/progress_diary_entries/:date', to: 'progress_diary_entries#fetch_by_date', as: 'progress_diary_by_date'
  resources :progress_diary_entries, only: [:create, :destroy]
end
