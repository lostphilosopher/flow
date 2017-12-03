Rails.application.routes.draw do
  devise_for :users
  resources :plans do
    resources :plan_stages
    member do
      post :publish
    end
  end
  resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
