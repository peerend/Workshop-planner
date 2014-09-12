Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


root :to => 'workshops#index'

  resources :workshops
  resources :locations
  resources :sessions
  resources :users
  resources :slots
  
end

