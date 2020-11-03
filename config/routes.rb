Rails.application.routes.draw do

  
	root 'home#index'

  resources :users, only: [:new,:create] do
  	get 'profile'
  end 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
