# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "submissions#index"
  resources :submissions, only: %i[index new create show]
  resources :users, only: %i[show]
end
