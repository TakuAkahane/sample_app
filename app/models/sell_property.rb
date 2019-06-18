# encoding: utf-8
# frozen_string_literal: true

class SellProperty < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include RelationshipWithProperty
  include SellingReason
  include PropertyType
end
