Rails.application.routes.draw do
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
  get 'admin/users', to: 'admin#users'
  post 'admin/users/make_admin', to: 'admin#make_admin'
  post 'admin/users/make_creator', to: 'admin#make_creator'
  post 'admin/users/make_user', to: 'admin#make_user'
  delete 'admin/users/delete_user', to: 'admin#delete_user'
  root to: 'home#index'
end
