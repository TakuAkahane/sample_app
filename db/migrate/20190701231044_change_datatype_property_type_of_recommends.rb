class ChangeDatatypePropertyTypeOfRecommends < ActiveRecord::Migration[5.2]
  def change
    change_column :recommends, :recommend_name, :string, comment: 'レコメンド名', :null => false, limit: 30
    rename_column :recommends, :property_type, :building_classification
  end
end
