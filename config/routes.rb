Rails.application.routes.draw do
  root to:'sessions#index'

  resources :sessions, only: [:new, :create] do
    member do
      get :mentor
    end
  end
end
