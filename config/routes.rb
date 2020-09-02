Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :create]
  get "dashboard", to: "profiles#dashboard"
  resources :trainnings


  root to: 'pages#home'
end
