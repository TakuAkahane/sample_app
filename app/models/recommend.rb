# encoding: utf-8
# frozen_string_literal: true

class Recommend < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include BuildingClassification
  include WardId

  # 複数選択可能にするには、activerecord内で以下のserialize定義が必要
  serialize :building_classification, Array
  serialize :ward_id, Array
end
