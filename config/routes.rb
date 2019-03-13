# encoding: utf-8
# frozen_string_literal: true

Rails.application.routes.draw do
  get 'my', to: 'my#index'

  resources :buy_residential_properties
end
