Rails.application.routes.draw do

	root 'home#index'

	delete "sign_out" => "sessions#destroy"

	resources :sessions, only: [:new, :create, :destroy]
	resources :teams do
		resources :team_users
	end
	
	resources :users

end
