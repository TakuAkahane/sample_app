class AddColumnSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :standard_plan_main_role_id, :integer, length: 11, comment: 'スタンダードプランメインユーザID'
    add_column :settings, :light_plan_main_role_id, :integer, length: 11, comment: 'ライトプランメインユーザID'
    add_column :settings, :trial_plan_main_role_id, :integer, length: 11, comment: 'トライアルプランメインユーザID'
    add_column :settings, :alumni_plan_main_role_id, :integer, length: 11, comment: 'アルムナイプランメインユーザID'
  end
end
