Rails.application.routes.draw do

  root 'home#index'

  delete "sign_out" => "sessions#destroy"
	get 'my_team' => "teams#my_team"

	resources :sessions, only: [:new, :create, :destroy]
	resources :teams do
		resources :team_users
	end

	resources :teams
	resources :users

  resources :trips
  resources :bicycles
  resources :vouchers

end
