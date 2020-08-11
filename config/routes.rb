Rails.application.routes.draw do
  root to: "pages#home"

  resources :profiles, only: [:show, :edit, :update]

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
