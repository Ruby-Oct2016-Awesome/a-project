Rails.application.routes.draw do

  root 'home#index'

  delete "sign_out" => "sessions#destroy"

  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
  	resources :orders, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :orders, only: [:index, :show]
  resources :stations
  resources :trips
  resources :bicycles
  resources :vouchers

end
