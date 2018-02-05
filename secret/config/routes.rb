Rails.application.routes.draw do
  
=begin 
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

get 'static_pages/home'

  get 'static_pages/secret_page'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  get 'users/destroy'
=end

  root to:'static_pages#home'


  resources :users

  get 'static_pages/secret_page', to:'static_pages#secret_page'

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new' 
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'

  post   '/signup',   to: 'users#create'

  post   '/users/:id/edit(.:format)',   to: 'users#edit'

  get    '/users/:id/user/destroy(.:format)', to: 'users#destroy'
  #resources :static_pages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
