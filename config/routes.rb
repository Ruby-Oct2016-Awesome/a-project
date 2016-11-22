Rails.application.routes.draw do

  root 'home#index'

  delete "sign_out" => "sessions#destroy"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :stations
  resources :trips
  resources :bicycles

end
