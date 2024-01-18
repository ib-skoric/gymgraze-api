Rails.application.routes.draw do
  get 'food_diary_entry/index'
  get 'food_diary_entry/show'
  get 'food_diary_entry/create'
  get 'food_diary_entry/update'
  get 'food_diary_entry/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post '/authenticate', to: 'authentication#create'
  resources :user, only: [:show]
  resources :user, only: [:index]

  resources :food_diary_entry, only: [:index, :show, :create, :update, :destroy]
end
