Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end
end
