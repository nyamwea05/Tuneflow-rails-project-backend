Rails.application.routes.draw do
  resources :users
  resources :songs
  resources :favorites, only:[:show, :create, :destroy, :index ]
  resources :playlists, only:[:index, :create, :update, :destroy, :show]
  resources :comments, only:[:update, :index, :destroy, :create]
  resources :albums, only:[:index, :show]
  resources :artists, only:[:index, :show]

#custom routes
  post '/signup' ,to: 'users#create'
  get '/me',to: 'users#show'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/artists/:id/albums', to: 'artists#albums'
  get '/albums/:id/songs', to: 'albums#albumsong'

  patch '/users/:username/update_password', to: 'users#update_password'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
