# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "items#index"
  resources :users, only: %i[show]
  resources :items do
    post "/comment", to: "items#comment", as: :comment
    post "/upvote", to: "votes#upvote", as: :upvote
    post "/downvote", to: "votes#downvote", as: :downvote
    delete "/unvote", to: "votes#destroy", as: :unvote
  end
  resources :items, only: %i[index new create show]
end
