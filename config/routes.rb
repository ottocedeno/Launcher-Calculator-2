Rails.application.routes.draw do
  get 'static/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static#home'

  get '/login' => 'session#new', as: 'login'
  get '/signup' => 'users#new', as: 'signup'
  resources :session, only: [:new, :create]
end
