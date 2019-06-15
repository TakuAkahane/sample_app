class AddColumnSellProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :sell_properties, :selling_reason, :string, comment: '売却理由'
  end
end
