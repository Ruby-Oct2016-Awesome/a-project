Rails.application.routes.draw do

  root 'home#index'
  delete "sign_out" => "sessions#destroy"
  get "/pages/*page" => "pages#show" , as: "page"  # *page -> [page] as an array
  # get "/pages/:page" => "pages#show"  # :page as a signle value

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
  resources :orders, only: [:index, :show]
  resources :stations
  resources :trips
  resources :bicycles
  resources :vouchers

end
