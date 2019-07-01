# encoding: utf-8
# frozen_string_literal: true

class Recommend < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include BuildingClassification

  serialize :building_classification, Array
end
