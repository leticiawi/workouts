Rails.application.routes.draw do
  get 'user_dashboards/index'
  devise_for :users

  resources :profiles, only: [:new, :create]
  resources :user_dashboards, only: [:index]
  resources :trainnings


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
