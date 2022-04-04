Rails.application.routes.draw do
  root 'pages#home'

  get 'about',    to: 'pages#about'
  get 'contact',  to: 'pages#contact'
  get 'login',    to: 'sessions#new'
  get 'logout',   to: 'sessions#destroy'
  get 'signup',   to: 'users#new'

  resources :sessions, only: :create
  resources :users
end
