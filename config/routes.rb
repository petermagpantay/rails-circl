Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :profiles, only: [:show]

  resources :requests, only: [:index, :show, :edit, :update] do
    member do
      patch :validate
    end
  end

  resources :events do
    resources :requests, only: [:new, :create]
    resources :comments, only: [:new, :create]
  end
end
