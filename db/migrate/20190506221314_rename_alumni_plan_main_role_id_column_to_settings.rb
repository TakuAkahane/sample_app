class RenameAlumniPlanMainRoleIdColumnToSettings < ActiveRecord::Migration[5.2]
  def change
    rename_column :settings, :alumni_plan_main_role_id, :system_owner_main_role_id
  end
end
