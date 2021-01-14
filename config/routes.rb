Rails.application.routes.draw do

  get 'users/new'
  root 'articles#index'

  get '/articles', to: 'articles#index'

  get :signup, to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: :create

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
