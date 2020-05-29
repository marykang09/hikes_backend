Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  get '/users/decode_token', to: 'users#decode_token'
  resources :hikes, only: [:create, :update, :destroy]
  resources :users, only: [:show, :index, :create]
  resources :trails, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
