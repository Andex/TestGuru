Rails.application.routes.draw do

  root 'tests#index'
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  get '/articles', to: 'articles#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :feedbacks, only: %i[new create]
  resources :badges, only: %i[index show]

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, only: :index
    resources :badges
  end
end
