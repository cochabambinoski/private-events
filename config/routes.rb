# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events
  root   'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :events, only: %i[create destroy]
end
