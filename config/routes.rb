RottenMangoes::Application.routes.draw do
  resources :movies do
    resources :reviews, only: [:new, :create]
  end

  namespace :admin do
    resources :users
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  root to: 'movies#index'
  get 'search', to: 'search#search'

end
