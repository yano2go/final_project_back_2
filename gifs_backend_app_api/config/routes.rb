Rails.application.routes.draw do
  resources :users, only: [:create]
  post '/login', to: 'users#login'
  get '/auto_login', to: 'users#auto_login'
  resources :gifs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
