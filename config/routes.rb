Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :create]
  get "dashboard", to: "profiles#dashboard"
  resources :trainnings, only: [:new, :create, :show]


  root to: 'pages#home'
end
