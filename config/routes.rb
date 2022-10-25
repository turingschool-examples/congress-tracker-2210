Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  post '/users', to: 'users#create'
  get '/register', to: 'users#new'
  get '/login', to: "users#login_form"
  post '/login', to: "users#login_user"
  get '/dashboard', to: 'congress#search_options'
  post '/search', to: 'congress#search'
  post '/search_state', to:'congress#search_state'
end
