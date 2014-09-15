Rails.application.routes.draw do

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'


root :to => 'workshops#index'

  resources :workshops
  resources :locations
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :create]
  resources :slots
  
end

