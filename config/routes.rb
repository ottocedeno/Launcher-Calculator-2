Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #Home
  root 'static#home'

  # Login/Signup Flow
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get '/login' => 'sessions#new', as: 'login'
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/signup' => 'users#new', as: 'signup'
  resource :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]

  # Main Resources
  resources :users do
    resources :missions, only: [:index, :show, :new, :edit]
  end

  resources :missions, only: [:create, :update, :destroy]
  get 'missions/successful' => 'missions#successful_missions', as: 'successful_missions'
  
  resources :rockets, only: [:index, :create, :show]
  patch '/rockets/:id' => 'rockets#update'

  resources :spaceports, only: [:index, :create, :show]
  patch '/spaceports/:id' => 'spaceports#update'

  resources :orbits, only: [:index, :create, :show]
  patch '/orbits/:id' => 'orbits#update'

  # Admin only routes
  resource :admin do
    resources :rockets, only: [:new, :edit, :destroy]
    resources :spaceports, only: [:new, :edit, :destroy]
    resources :orbits, only: [:new, :edit, :destroy]
  end

  #Additional Routes
  get '/about' => 'static#about', as: 'about'
end
