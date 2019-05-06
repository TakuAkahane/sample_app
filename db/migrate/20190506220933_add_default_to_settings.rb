class AddDefaultToSettings < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.find_by(id: 1)
    setting.standard_plan_main_role_id = 3
    setting.light_plan_main_role_id = 6
    setting.trial_plan_main_role_id = 10
    setting.save
  end
end
