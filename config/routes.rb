Rails.application.routes.draw do

  root 'home#index'

  delete "sign_out" => "sessions#destroy"

<<<<<<< HEAD
	get 'my_team' => "teams#my_team"

	resources :sessions, only: [:new, :create, :destroy]
	resources :teams do
		resources :team_users
	end

	resources :teams
	resources :users
=======
  resources :trips
  resources :bicycles
  resources :vouchers
>>>>>>> 6c5a37f8382bdbb11804bb7c0b487b5b4299aac7

end
