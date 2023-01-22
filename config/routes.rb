# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  scope :items do
    post "/:id/comment", to: "items#comment", as: :comment
  end
  resources :items, only: %i[index new create show]
  resources :users, only: %i[show]
end
