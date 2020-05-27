Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  # post '/users/:id/hikes', to: 'users#create_hike'
  get '/users/decode_token', to: 'users#decode_token'
  resources :hikes
  resources :users
  resources :trails
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
