Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/logged_in', to: 'session#is_logged_in?'

  resources :users, only: [:create, :show, :index]
  resources :profilephotos, only: [:create, :index, :show, :destroy]

end
