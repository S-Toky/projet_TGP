Rails.application.routes.draw do	
 
	root to: 'statics#home'
  get 'statics/contact'
  get 'statics/team'
  
	resources :gossips 
	resources :users
	resources :cities
	resources :comments
  resources :sessions, only: [:new, :create, :destroy]
  resources :gossips do
  	resources :likes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
