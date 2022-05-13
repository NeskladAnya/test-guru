Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }, controllers: {sessions: "sessions"}

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[ show update ] do
    resources :gists, only: :create
    member do
      get :result
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end

  resources :feedbacks, only: %i[ index create ]
end
