# encoding: utf-8
# frozen_string_literal: true

class Company < ApplicationRecord
  # テーブルのアソシエーション定義
  has_many :users, -> { with_deleted }

  # 列挙型カラム向け gem 利用
  include CompanyPublicStatus
end
