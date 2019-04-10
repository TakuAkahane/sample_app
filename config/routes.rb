# encoding: utf-8
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  get 'my', to: 'my#index'

  # TODO: rootを再定義（myはlogin userのみにする）
  # userのroot定義
  root 'my#index'

  resources :buy_residential_properties, only: %i[] do
    collection do
      # 管理
      get 'manage/new' => 'buy_residential_properties#new'
      get 'manage/index' => 'buy_residential_properties#index'
      post 'manage/create' => 'buy_residential_properties#create'
      # 検索
      get :active
    end
    member do
      # 管理
      get 'manage/show' => 'buy_residential_properties#show'
      get 'manage/edit' => 'buy_residential_properties#edit'
      delete 'manage/delete' => 'buy_residential_properties#delete'
      patch 'manage/update' => 'buy_residential_properties#update'
    end
  end

  # user関連
  devise_for :users, path: 'users',
                     controllers: {
                       users: 'users',
                       omniauth_callbacks: 'users/omniauth_callbacks',
                       sessions: 'users/sessions',
                       registrations: 'users/registrations',
                       confirmations: 'users/confirmations',
                       unlocks: 'users/unlocks',
                       passwords: 'users/passwords'
                     }
end
