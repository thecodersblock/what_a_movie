Rails.application.routes.draw do
  get '/users/login', to: 'users#new'

  resources :genres
  resources :users
  resources :movies
  namespace :api do
    resources :movies
    resources :users
    post '/users/login', to: 'users#login'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
