Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login' => 'sessions#new', as: 'login'
  get '/signup' => 'users#new', as: 'signup'
  resources :sessions, only: [:new, :create]
end
