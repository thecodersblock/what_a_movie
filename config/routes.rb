Rails.application.routes.draw do
  get '/users/login', to: 'users#new'

  resources :genres
  resources :users
  resources :movies
  namespace :api do
    resources :movies
    resources :users
    post '/users/login', to: 'users#login'
    post '/users/logout', to: 'users#logout'
    # get '/movies/favorite', to: 'movies#index_favorite'
    post '/movies/:id/favorite', to: 'movies#favorite'
    post '/movies/:id/unfavorite', to: 'movies#unfavorite'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
