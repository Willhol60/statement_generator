# frozen_string_literal: true

Rails.application.routes.draw do
  root 'statements#index'

  resources :expenditures, only: %i[create destroy]
  resources :incomes, only: %i[create destroy]
  resources :statements

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
