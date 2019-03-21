# encoding: utf-8
# frozen_string_literal: true

#----------------------------------------------------------------------------#
# 列挙型カラムの要素定義 config/locale/ja.yml の enumerize と対応
#----------------------------------------------------------------------------#
# 住居タイプ
module PropertyType
  extend Enumerize
  enumerize :property_type, in: %i[unit_apartment whole_building_apartment house],
                            multiple: false
end

#----------------------------------------------------------------------------#
# Activerecord 基底クラス
#----------------------------------------------------------------------------#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
