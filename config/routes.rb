Rails.application.routes.draw do
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  resources :topics
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites' => "favorites#create"
  delete '/favorites' => "favorites#destroy"
  
  get 'comments/new' 
  post '/comments' => "comments#create"
end
