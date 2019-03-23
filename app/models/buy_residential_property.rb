class BuyResidentialProperty < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include PropertyType
  include WardId
  include FloorePlan
  include BalconyDirection
  include RightsConceningLand

  # validate
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :floore_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :completion_date, presence: true
  validates :ward_id, presence: true
  validates :floore_plan, presence: true
  validates :rights_concening_land, presence: true
  validates :property_type, presence: true
end
