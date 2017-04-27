Rails.application.routes.draw do
  resources :posts

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #get 'home/index'
  root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
