Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'pages#index'

  get 'pages/index'
  get '/statistics', to: 'statistics#index'
  post '/statistics/change_subject', to: 'statistics#change_subject'
  resources :test, only: [:index, :create] do
    post 'next_step', on: :collection
    post 'update_setting', on: :collection
  end
  get '/users/:id/statistic', to: 'users#statistic', as: :statistic_user
  get '/users/:id/statistics', to: 'users#statistics', as: :statistics_user
  get '/users/statistic/:id', to: 'users#statistic'
  post '/users/subject_statistics', to: 'users#subject_statistics', as: :subject_statistics_user

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
end
