Rails.application.routes.draw do

  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#index"
  resources :recipes
  resources :foods
  get 'ingredients/new/:recipe_id', to: 'ingredients#new', as: 'new_ingredient'
  post 'ingredients/new/:recipe_id', to: 'ingredients#create', as: 'create_ingredient'
  resources :public_recipes, only: [:index]
  resources :general_shopping_list, only: [:index]
end
