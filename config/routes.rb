# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/kawasaki',      to: 'static_pages#kawasaki'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions' ,
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
end
