Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/authenticate', to: 'authentication#create'
  resources :user, only: [:show, :index, :create]
  get "/profile" => "user#profile"

  post '/confirm_email', to: 'user#confirm_email'
  post '/resend_confirmation_email', to: 'user#resend_confirmation_email'

  post '/request_password_reset', to: 'user#request_password_reset'
  post '/reset_password', to: 'user#reset_password'

  post '/check_email_exists', to: 'user#check_email_exists'

  resources :exercises, only: [:create, :show, :index]
  resources :workout_diary_entries, only: [:create, :show]
  resources :workouts, only: [:create, :show]
  resources :foods, only: [:create, :show]
  resources :exercise_set, only: [:index, :show, :create]

  resources :food_diary_entries, only: [:index, :show, :create, :update, :destroy]
end
