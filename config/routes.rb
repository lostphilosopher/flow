Rails.application.routes.draw do
  resources :plans do
    resources :plan_stages
  end
  resources :stages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
