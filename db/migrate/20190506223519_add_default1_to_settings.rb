class AddDefault1ToSettings < ActiveRecord::Migration[5.2]
  def change
    setting = Setting.find_by(id: 1)
    setting.system_owner_main_role_id = 20
    setting.save
  end
end
