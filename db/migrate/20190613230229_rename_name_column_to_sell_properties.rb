class RenameNameColumnToSellProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :sell_properties, :name, :property_name
    rename_column :buy_investment_properties, :name, :property_name
  end
end
