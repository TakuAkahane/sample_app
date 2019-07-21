# encoding: utf-8
# frozen_string_literal: true

Rails.application.routes.draw do
  get 'my', to: 'my#index'

  # TODO: rootを再定義（myはlogin userのみにする）
  # userのroot定義
  root 'my#index'

  # レコメンド
  resources :recommends, only: %i[] do
    collection do
      # 管理
      get 'manage/index' => 'recommends#index'
      get 'manage/new' => 'recommends#new'
      post 'manage/create' => 'recommends#create'
      # 検索
      get :active
    end
    member do
      # 管理
      get 'manage/view' => 'recommends#view'
      get 'manage/edit' => 'recommends#edit'
      patch 'manage/update' => 'recommends#update'
      get 'manage/detail' => 'recommends#detail'
      delete 'manage/delete' => 'recommends#delete'
      # 検索
      get :detail
    end
  end

  # 提案
  resources :proposals, only: %i[] do
    collection do
      # 管理
      get 'manage/index' => 'proposals#index'
      post 'manage/create' => 'proposals#create'
    end
    member do
      # 管理
      get 'manage/new' => 'proposals#new'
      get 'manage/view' => 'proposals#view'
      get 'manage/edit' => 'proposals#edit'
      patch 'manage/update' => 'proposals#update'
      get 'manage/detail' => 'proposals#detail'
      delete 'manage/delete' => 'proposals#delete'
      # 検索
      get :detail
    end
  end

  # お問い合わせ
  resources :contacts, only: %i[new] do
    collection do
      post :confirm
      post :complete
    end
  end

  # 物件売却
  resources :sell_properties, only: %i[] do
    collection do
      # 管理
      get 'manage/index' => 'sell_properties#index'
      get 'manage/new' => 'sell_properties#new'
      post 'manage/create' => 'sell_properties#create'
      # 検索
      get :active
    end
    member do
      # 管理
      get 'manage/view' => 'sell_properties#view'
      get 'manage/edit' => 'sell_properties#edit'
      patch 'manage/update' => 'sell_properties#update'
      get 'manage/detail' => 'sell_properties#detail'
      delete 'manage/delete' => 'sell_properties#delete'
      # 検索
      get :detail
    end
  end
  # よく検索されるキーワード
  get 'sell_properties/:keyword' => 'sell_properties#keyword', as: 'sell_properties_keyword'

  resources :sell_properties_manage_conditions, only: %i[destroy] do
    collection do
      post :save_manage_condition
      get :search
    end
  end
  resources :sell_properties_search_conditions, only: %i[destroy] do
    collection do
      post :save_search_condition
      get :search
    end
  end


  # 投資用物件
  resources :buy_investment_properties, only: %i[] do
    collection do
      # 管理
      get 'manage/index' => 'buy_investment_properties#index'
      get 'manage/new' => 'buy_investment_properties#new'
      post 'manage/preview' => 'buy_investment_properties#preview'
      patch 'manage/preview' => 'buy_investment_properties#preview'
      post 'manage/create' => 'buy_investment_properties#create'
      post 'manage/create_draft' => 'buy_investment_properties#create_draft'
      patch 'manage/update_memo' => 'buy_investment_properties#update_memo'
      # 検索
      get :active
      post :revise
    end
    member do
      # 管理
      get 'manage/view' => 'buy_investment_properties#view'
      get 'manage/edit' => 'buy_investment_properties#edit'
      patch 'manage/update' => 'buy_investment_properties#update'
      patch 'manage/update_draft' => 'buy_investment_properties#update_draft'
      get 'manage/detail' => 'buy_investment_properties#detail'
      delete 'manage/delete' => 'buy_investment_properties#delete'
      # 検索
      get :detail
      get 'category' => 'buy_investment_properties#category'
    end
  end
  # よく検索されるキーワード
  get 'buy_investment_properties/:keyword' => 'buy_investment_properties#keyword', as: 'buy_investment_properties_keyword'

  resources :investment_properties_manage_conditions, only: %i[destroy] do
    collection do
      post :save_manage_condition
      get :search
    end
  end
  resources :investment_properties_search_conditions, only: %i[destroy] do
    collection do
      post :save_search_condition
      get :search
    end
  end

  # 居住用物件
  resources :buy_residential_properties, only: %i[] do
    collection do
      # 管理
      get 'manage/index' => 'buy_residential_properties#index'
      get 'manage/new' => 'buy_residential_properties#new'
      post 'manage/preview' => 'buy_residential_properties#preview'
      patch 'manage/preview' => 'buy_residential_properties#preview'
      post 'manage/create' => 'buy_residential_properties#create'
      post 'manage/create_draft' => 'buy_residential_properties#create_draft'
      patch 'manage/update_memo' => 'buy_residential_properties#update_memo'
      # 検索
      get :active
      post :revise
    end
    member do
      # 管理
      get 'manage/view' => 'buy_residential_properties#view'
      get 'manage/edit' => 'buy_residential_properties#edit'
      patch 'manage/update' => 'buy_residential_properties#update'
      patch 'manage/update_draft' => 'buy_residential_properties#update_draft'
      get 'manage/detail' => 'buy_residential_properties#detail'
      delete 'manage/delete' => 'buy_residential_properties#delete'
      # 検索
      get :detail
      get 'category' => 'buy_residential_properties#category'
    end
  end
  # よく検索されるキーワード
  get 'buy_residential_properties/:keyword' => 'buy_residential_properties#keyword', as: 'buy_residential_properties_keyword'

  resources :residential_properties_manage_conditions, only: %i[destroy] do
    collection do
      post :save_manage_condition
      get :search
    end
  end
  resources :residential_properties_search_conditions, only: %i[destroy] do
    collection do
      post :save_search_condition
      get :search
    end
  end

  # ユーザ関連
  resources :users, only: %i[edit update]

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

  # 本体側からシステム管理側の routing を呼び出す場合、 rcadmin.XXX にする
  mount Rcadmin::Engine, at: '/rcadmin', as: 'rcadmin'
end
