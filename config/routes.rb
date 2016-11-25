Rails.application.routes.draw do

  root 'home#index'
  delete "sign_out" => "sessions#destroy"
  get "/pages/*page" => "pages#show" , as: "page"  # *page -> [page] as an array
  # get "/pages/:page" => "pages#show"  # :page as a signle value
  get "list" => "pages#index"

  resources :team
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :orders, only: [:show, :new, :create, :edit, :update, :destroy]
    collection do
      get :code
      get :nearby
      get :voucher
      get :personal
      get :setting
    end
  end
  resources :orders
  resources :stations
  resources :trips
  resources :bicycles
  resources :vouchers do
    resources :orders
    collection do 
      get :instructions
      get :my_vouchers
    end
    member do
      get :redeem
      get :purchase
    end
  end

end
