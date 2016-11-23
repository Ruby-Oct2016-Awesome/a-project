Rails.application.routes.draw do

  root 'home#index'
  delete "sign_out" => "sessions#destroy"
  get "/pages/*page" => "pages#show"	# *page -> [page] as an array
  # get "/pages/:page" => "pages#show"	# :page as a signle value

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :stations
  resources :trips
  resources :bicycles
  resources :vouchers

end
