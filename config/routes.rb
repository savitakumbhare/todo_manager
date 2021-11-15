Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/" => "home#index"
  resources :todos
  resources :users
  get "/signin" => "session#new", as: :new_sessions
  post "/signin" => "session#create", as: :sessions
  delete "/signout" => "session#destroy", as: :destroy_session
end
