class ChangeDatatypeSystemOwnerMainRoleIdOfSettings < ActiveRecord::Migration[5.2]
  def change
    change_column :settings, :system_owner_main_role_id, :integer, length: 11, comment: 'システムオーナーメインユーザID'
  end
end
