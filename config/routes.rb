Rails.application.routes.draw do
  devise_for :users

  resources :categories do
    resources :trainnings, only: [:index]
  end

  resources :trainnings do
    resources :reviews, only: [:create, :new]
  end

  resources :profiles, only: [:new, :create, :update, :destroy, :show]

  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  get "dashboard", to: "profiles#dashboard"
  get "trainer_board", to: "profiles#dashboard"
  get "trainer_index", to: "trainnings#trainer_index"
  get "trainer_show/:id", to: "trainnings#trainer_show", as: "trainer_show"
  get "checkout", to: "pages#checkout"

  root to: 'pages#home'
  mount StripeEvent::Engine, at: '/stripe-webhooks'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

