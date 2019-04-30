# encoding: utf-8
# frozen_string_literal: true

Rails.application.routes.draw do
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
      get 'manage/view' => 'buy_residential_properties#view'
      get 'manage/detail' => 'buy_residential_properties#detail'
      get 'manage/edit' => 'buy_residential_properties#edit'
      delete 'manage/delete' => 'buy_residential_properties#delete'
      patch 'manage/update' => 'buy_residential_properties#update'
    end
  end

  resources :users, only: %i[edit update]
  resources :users, except: %i[index show] do
    member do
      patch 'manage/change_account_type' => 'users#change_account_type'
      delete 'manage/destroy_sub_account' => 'users#destroy_sub_account'
    end
    collection do
      get 'manage/users' => 'users#index'
      get 'manage/change_in_charge' => 'users#change_in_charge'
      post 'manage/create_account' => 'users#create'
    end
  end

  # devise関連
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

  devise_scope :user do
    get 'manage/users/edit_account_type' => 'users#edit_account_type'
    get 'users/auth/sns_auth' => 'users/omniauth_callbacks#sns_auth'
    get 'users/password/editpass' => 'users/passwords#edit'
    put 'users/password/updatepass' => 'users/passwords#update'
    post 'users/sign_in' => 'users/sessions#create'
    get 'users/registrations' => 'users/registrations#index'
    get 'users/profile/edit_password' => 'users/registrations#edit_profile_password'
    patch 'users/profile/change_password' => 'users/registrations#edit_profile_email'
    get 'users/profile/edit_email' => 'users/registrations#edit_profile_email'
    patch 'users/profile/change_email' => 'users/registrations#change_profile_email'
    get 'users/profile/edit_email_reception_settings' => 'users/registrations#edit_mail_reception_settings'
    patch 'users/profile/change_mail_reception_settings' => 'users/registrations#change_mail_reception_settings'
    get 'users/thanks_company' => 'users/registrations#thanks'
    get 'users/thanks_personal' => 'users/registrations#thanks'
    get 'users/thanks_g_company' => 'users/registrations#tracking'
    get 'users/thanks_g_personal' => 'users/registrations#tracking'
    get 'users/thanks_f_company' => 'users/registrations#tracking'
    get 'users/thanks_f_personal' => 'users/registrations#tracking'
    get 'users/thanks_unknown_sns' => 'users/registrations#tracking'
  end
end
