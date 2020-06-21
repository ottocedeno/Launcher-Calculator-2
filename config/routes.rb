Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/login' => 'session#new', as: 'login'
  get '/signup' => 'users#new', as: 'signup'
  resources :session, only: [:create]
end
