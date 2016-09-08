Rails.application.routes.draw do
  resource :leagues, only: [:index]

  root 'leagues#index'

  namespace :admin do
    resource :session, only: [:new, :create, :destroy]
    resource :dashboard, only: [:show, :update]
    resources :leagues, only: [:show, :update] do
      resources :competitors, only: [:create, :destroy, :update]
      resources :matches, only: [:new, :create]
    end
    resources :competitors, only: [:show] do
      resources :matches, only: [:update]
    end
  end
end
