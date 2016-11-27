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
    resources :trips, only: [:index, :show] do
      collection do
        get 'distance_by_day'
      end
    end
    collection do
      get :code
      get :nearby
      get :voucher
      get :personal
      get :setting
      get :admin
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

  get 'edit_credit_card' => "users#edit_credit_card"
  patch 'update_credit_card' => "users#update_credit_card"
end
