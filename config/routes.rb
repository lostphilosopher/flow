Rails.application.routes.draw do
  resources :cms
  devise_for :users
  resources :plans do
    resources :plan_stages
    member do
      post :publish
      post :unpublish
    end
  end
  resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'admin', to: 'admin#index'
  root to: 'home#index'
end
