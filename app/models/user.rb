# encoding: utf-8
# frozen_string_literal: true

class User < ApplicationRecord
  # テーブルのアソシエーション定義
  belongs_to :company, optional: true
  belongs_to :role, optional: false, class_name: 'Trec::Role'

  # gem deviseで有効にする機能を列挙
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable, :omniauthable,
         omniauth_providers: %i[google_oauth2 facebook linkedin]
end
