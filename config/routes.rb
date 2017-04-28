Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #get 'home/index'
  root to: "home#index"
  #root to: "posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
