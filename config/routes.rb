Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :update, :destroy, :edit, :show] do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
  end

  resources :artworks, only: [:create, :new, :update, :destroy, :show, :edit] do
    resources :comments, only: [:index]
  end

  resources :comments, only: [:create, :destroy]
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get "/users/new", to: 'users#new'
  # get '/users/:id', to: 'users#show'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update'
  # put '/users/:id', to: 'users#update'
  # delete '/users/:id', to: 'users#destroy'

  resources :artwork_shares, only: [:create, :destroy]
  
end
