Rails.application.routes.draw do
  devise_for :users

  resources :profiles, only: [:new, :create]
  get "dashboard", to: "profiles#dashboard"
  resources :trainnings


  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
