Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :profiles, only: [:new, :create, :update, :destroy]

  get "dashboard", to: "profiles#dashboard"
  get "trainer_board", to: "profiles#dashboard"
  resources :trainnings
  get "trainer_index", to: "trainnings#trainer_index"
  get "trainer_show/:id", to: "trainnings#trainer_show", as: "trainer_show"


  root to: 'pages#home'

  # action cable chat
  # root to: 'chats#show'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
