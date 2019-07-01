class AddColumnRecommends < ActiveRecord::Migration[5.2]
  def change
    add_column :recommends, :property_type, :string, comment: '物件種別', :null => false
    add_column :recommends, :ward_id, :string, comment: '区ID', :null => false
    add_column :recommends, :require_price_min, :string, comment: '希望物件価格下限', :null => false
    add_column :recommends, :require_price_max, :string, comment: '希望物件価格上限', :null => false
    add_column :recommends, :gross_rate_of_return, :string, comment: '表面利回り', :null => false
    add_column :recommends, :building_structure, :string, comment: '建物の構造', :null => false
    add_column :recommends, :time_to_nearest_station, :string, comment: '最寄り駅までの時間', :null => false
    add_column :recommends, :comment, :text, comment: 'コメント'
    add_column :recommends, :recommend_name, :string, comment: 'レコメンド名', :null => false, limit: 30
  end
end
