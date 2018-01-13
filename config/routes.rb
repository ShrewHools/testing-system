Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#index'

  get 'pages/index'
  resources :test, only: [:index, :create] do
    post 'next_step', on: :collection
    post 'update_setting', on: :collection
  end
end
