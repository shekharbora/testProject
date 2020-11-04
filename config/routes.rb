Rails.application.routes.draw do

  
	root 'home#index'

  resources :users, only: [:new,:create] do
  	get 'profile'
  	get 'search_expert'
  end 
  get '/s/:url_slug', to: 'users#link_show', as: :short
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
