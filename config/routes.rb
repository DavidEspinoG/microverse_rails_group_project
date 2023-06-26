Rails.application.routes.draw do
  resources :foods, only: [:index, :new, :create]
end
