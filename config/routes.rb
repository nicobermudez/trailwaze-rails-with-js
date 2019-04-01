Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/login', to: 'sessions#new'
  post '/sessions/create', to: "sessions#create"
  post '/users/create', to: "users#create"
  get '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create'
  resources :users do
    resources :itineraries
  end
  # resources :destinations
end
