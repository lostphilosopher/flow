Rails.application.routes.draw do
  resources :plan_stages
  resources :stages
  resources :plans
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
