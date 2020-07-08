Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Login Flow
  root 'static#home'
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/signup' => 'users#new', as: 'signup'
  get '/about' => 'static#about', as: 'about'
  resource :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  # Main Resources
  resources :rockets, only: [:index, :create, :show]
  patch '/rockets/:id' => 'rockets#update'

  resources :spaceports, only: [:index]
  
  resource :admin do
    resources :rockets, only: [:new, :edit, :destroy]
  end
end
