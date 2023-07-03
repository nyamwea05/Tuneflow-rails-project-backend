Rails.application.routes.draw do
  resources :users
  resources :songs
  resources :favorites, only:[:show, :create, :destroy, :index ]
  resources :playlists, only:[:index, :create, :update, :destroy]
  resources :comments, only:[:update, :index, :destroy, :create]
  resources :albums, only:[:index, :show]
  resources :artists, only:[:index, :show]

#custom routes 
  post '/signup' ,to: 'users#create'
  get '/me',to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
