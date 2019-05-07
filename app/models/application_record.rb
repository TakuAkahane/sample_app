# encoding: utf-8
# frozen_string_literal: true

#----------------------------------------------------------------------------#
# 列挙型カラムの要素定義 config/locale/ja.yml の enumerize と対応
#----------------------------------------------------------------------------#
# 住居タイプ
module PropertyType
  extend Enumerize
  enumerize :property_type, in: %i[unit_apartment whole_building_apartment house],
                            multiple: true
end
# 区ID
module WardId
  extend Enumerize
  enumerize :ward_id, in: %i[minato chuo shibuya shinjuku shinagawa meguro
                             chiyoda bunkyo setagaya nakano suginami toshima
                             sumida katsushika eodgawa taito koto ota kita
                             arakawa itabashi nerima adachi], multiple: true
end
# 間取り
module FloorePlan
  extend Enumerize
  enumerize :floore_plan, in: %i[1r 1k 1dk 1ldk 2k 2dk 2ldk 3k 3dk 3ldk
                                 4k 4dk 4ldk 5k 5dk 5ldk], multiple: true
end
# ベランダ向き
module BalconyDirection
  extend Enumerize
  enumerize :balcony_direction, in: %i[east west south north], multiple: true
end
# 権利
module RightsConceningLand
  extend Enumerize
  enumerize :rights_concening_land, in: %i[ownership leasehod], multiple: false
end
# 会社公開状況
module CompanyPublicStatus
  extend Enumerize
  enumerize :public, in: %i[public private], multiple: false
end
# アカウントタイプ（メイン/サブ管理者/サブユーザ）
module AccountType
  extend Enumerize
  enumerize :account_type, in: %i[main_account sub_account_admin sub_account_user], multiple: false
end
# お問い合わせの種類
module InquiryType
  extend Enumerize
  enumerize :inquirytype, in: %i[about_trec media_coverage], multiple: false
end

#----------------------------------------------------------------------------#
# Activerecord 基底クラス
#----------------------------------------------------------------------------#
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
