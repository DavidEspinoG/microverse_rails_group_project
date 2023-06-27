Rails.application.routes.draw do

  devise_for :users
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "home#index"
  resources :recipes
  resources :foods, only: [:index, :new, :create]
  resources :public_recipes, only: [:index]

end
