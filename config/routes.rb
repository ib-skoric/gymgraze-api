Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/authenticate', to: 'authentication#create'
  resources :user, only: [:show, :index, :create]
  get "/profile" => "user#profile"

  post '/confirm_email', to: 'user#confirm_email'
  post '/resend_confirmation_email', to: 'user#resend_confirmation_email'

  resources :exercises, only: [:create]
  resources :exercise_diary_entries, only: [:create, :show]

  resources :food_diary_entries, only: [:index, :show, :create, :update, :destroy]
end
