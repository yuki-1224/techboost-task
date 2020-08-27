Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
