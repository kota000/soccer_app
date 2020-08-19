# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/kawasaki',   to: 'static_pages#kawasaki'
  get '/goosaka',    to: 'static_pages#goosaka'
  get '/seresso',    to: 'static_pages#seresso'
  get '/nagoya',     to: 'static_pages#nagoya'
  get '/kasiwa',     to: 'static_pages#kasiwa'
  get '/fctokyo',    to: 'static_pages#fctokyo'
  get '/urawa',      to: 'static_pages#urawa'
  get '/hirosima',   to: 'static_pages#hirosima'
  get '/sapporo',    to: 'static_pages#sapporo'
  get '/koube',      to: 'static_pages#koube'
  get '/yokohamafm', to: 'static_pages#yokohamafm'
  get '/kasima',     to: 'static_pages#kasima'
  get '/senndai',    to: 'static_pages#senndai'
  get '/simizu',     to: 'static_pages#simizu'
  get '/saganntosu', to: 'static_pages#saganntosu'
  get '/ooita',      to: 'static_pages#ooita'
  get '/shounann',   to: 'static_pages#shounann'
  get '/yokohamafc', to: 'static_pages#yokohamafc'
  get '/all',        to: 'static_pages#all'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
  }
  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:show]
  resources :posts
end
