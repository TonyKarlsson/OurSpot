Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :chatrooms, only: [:index, :show]
  resources :users, only: [:index]

  put '/add_friend', to: 'users#add_friend', as: :add_friend
end
