Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists  do
  	resources :cards do
  		resources :comments
  	end
  end

  get '/users', to: "users#index"
  get '/user', to: "users#find"
  put '/assign_admin', to: "users#assign_admin"
  post '/lists_assign' , to: "lists#set_users_lists"
end
