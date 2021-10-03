Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todos
  #resources :users
  post "users/create", to: "users#create"
  post "users/login", to: "users#login"
  get "users", to: "users#index"
end
