Rails.application.routes.draw do
  root 'users#index'

  # Message routes
  post 'messages/create' => 'messages#create'
  patch 'messages/edit' => 'messages#edit'
  delete 'messages/destroy' => 'messages#destroy'

  # Destination routes
  get 'destinations/home' => 'destinations#home'
  post 'destinations/create' => 'destinations#create'
  get 'destinations/show' => 'destinations#show'
  get 'destinations/view' => 'destinations#view'

  # Log in user account
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Create user account
  get '/sign_up' => 'users#new'
  post '/users' => 'users#create'

  # Create user profile
  get '/profiles' => 'profiles#index'
  get '/profiles/new' => 'profiles#new'
  post '/profiles/new' => 'profiles#create'
  get '/profiles/edit' => 'profiles#edit'
  patch '/profiles/update' => 'profiles#update'
  delete '/profiles/delete' => 'profiles#destroy'

  # Directing user to travel api to search for country profiles
  get '/profiles/search' => 'profiles#search'


end
