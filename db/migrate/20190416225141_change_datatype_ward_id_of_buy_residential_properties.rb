class ChangeDatatypeWardIdOfBuyResidentialProperties < ActiveRecord::Migration[5.2]
  def change
    change_column :buy_residential_properties, :ward_id, :string, limit: 15
  end
end
