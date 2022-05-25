Rails.application.routes.draw do

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }, controllers: {sessions: "sessions"}

  authenticated :user do
    root 'tests#index', as: :authenticated_root
  end

  unauthenticated :user do
    devise_scope :user do
      root 'sessions#new', as: :unauthenticated_root
    end
  end
  
  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[ show update ] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  resources :badges, only: :index

  namespace :admin do
    resources :gists, only: :index
    resources :badges, except: :show
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :feedbacks, only: %i[ index create ]

end
