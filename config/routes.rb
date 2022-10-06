Rails.application.routes.draw do
  get 'points/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'home#index'
  resources :branches
  resources :points
  devise_for :users
end
