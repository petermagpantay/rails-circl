Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'

  resources :profiles, only: [:show, :edit, :update]

  resources :requests, only: [:index, :edit, :update]

    resources :events do
      resources :requests, only: [:new, :create]
      resources :comments, only: [:new, :create]
    end
end
