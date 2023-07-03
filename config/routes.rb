Rails.application.routes.draw do
  resources :albums, only:[:index, :show]
  resources :artists, only:[:index, :show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


end
