Rails.application.routes.draw do
  resources :hikes
  resources :users
  resources :trails
  post '/login', to: 'auth#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
