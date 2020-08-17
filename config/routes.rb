Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations }
  root to: "pages#home"

  get "/categories", to: "events#index"

  resources :profiles, only: [:show, :edit, :update]

  resources :requests, only: [:index, :show, :edit, :update] do
    member do
      patch :validate
    end
  end

  resources :events do
    resources :requests, only: [:new, :create]
    resources :comments, only: :create
  end
end
