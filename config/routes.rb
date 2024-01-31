# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index'

  resources :posts, only: %i[index show new create] do
    resources :comments, only: %i[create], module: :posts
    resources :likes, only: %i[create destroy], module: :posts
  end

  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
