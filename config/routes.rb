Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  resources :users
  resources :attractions
  post '/rides', to: 'rides#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
