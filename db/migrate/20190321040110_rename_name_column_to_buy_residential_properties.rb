class RenameNameColumnToBuyResidentialProperties < ActiveRecord::Migration[5.2]
  def change
    rename_column :buy_residential_properties, :name, :property_name
  end
end
