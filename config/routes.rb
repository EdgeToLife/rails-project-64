# frozen_string_literal: true

Rails.application.routes.draw do

  root 'posts#index'

  resources :posts do
    resources :comments, only: [:index, :new, :create], module: :posts
    resources :likes, only: [:create, :destroy], module: :posts
  end

  resources :comments, only: [:show, :edit, :update, :destroy], module: :posts
  delete '/posts/:post_id/likes/:id', to: 'posts/likes#destroy'

  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

end
