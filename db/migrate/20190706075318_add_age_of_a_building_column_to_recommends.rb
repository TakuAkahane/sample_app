class AddAgeOfABuildingColumnToRecommends < ActiveRecord::Migration[5.2]
  def change
    add_column :recommends, :age_of_a_building, :string, comment: '築年数', :null => false, limit: 100
  end
end
