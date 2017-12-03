Rails.application.routes.draw do
  devise_for :users
  resources :plans do
    member do
      get :build_new
      post :build_create
    end
    resources :plan_stages
  end
  resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
