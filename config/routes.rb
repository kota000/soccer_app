# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/kawasaki',      to: 'static_pages#kawasaki'
end
