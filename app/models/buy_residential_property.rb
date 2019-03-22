class BuyResidentialProperty < ApplicationRecord
  # 列挙型カラム向け gem 利用
  include PropertyType

  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :floore_size, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :completion_date, presence: true
end
