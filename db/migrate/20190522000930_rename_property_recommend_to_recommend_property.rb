class RenamePropertyRecommendToRecommendProperty < ActiveRecord::Migration[5.2]
  def change
    rename_table :property_recommends, :recommends
  end
end
