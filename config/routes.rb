Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :profile, only: [:show]

  resources :requests, only: [:index, :edit, :update]

    resources :events do
      resources :requests, only: [:new, :create]
      resources :comments, only: [:new, :create]
    end
end
