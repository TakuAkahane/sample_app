class AddDefaultToRoles < ActiveRecord::Migration[5.2]
  def change
    @roles = [
      { id: 3, name: 'standard', title: 'Standard main', description: "スタンダード会員の権限定義です", the_role: '{"users":{}}', parent_id: nil, account_type: 'main_account' },
      { id: 4, name: 'standard_admin', title: 'Standard sub admin', description: "スタンダード会員の権限定義です", the_role: '{"users":{}}', parent_id: 3, account_type: 'sub_account_admin' },
      { id: 5, name: 'standard_user', title: 'Standard sub user', description: "スタンダード会員の権限定義です", the_role: '{"users":{}}', parent_id: 3, account_type: 'sub_account_user' },
      { id: 6, name: 'light', title: 'Light main', description: "ライト会員の権限定義です", the_role: '{"users":{}}', parent_id: nil, account_type: 'main_account', default_corporate: true },
      { id: 7, name: 'light_admin', title: 'Light sub admin', description: "ライト会員の権限定義です", the_role: '{"users":{}}', parent_id: 6, account_type: 'sub_account_admin' },
      { id: 8, name: 'light_user', title: 'Light sub user', description: "ライト会員の権限定義です", the_role: '{"users":{}}', parent_id: 6, account_type: 'sub_account_user' },
      { id: 10, name: 'trial', title: 'Trial main', description: "トライアル会員の権限定義です", the_role: '{"users":{}}', parent_id: nil, account_type: 'main_account' },
      { id: 11, name: 'trial_admin', title: 'Trial sub admin', description: "トライアル会員の権限定義です", the_role: '{"users":{}}', parent_id: 10, account_type: 'sub_account_admin' },
      { id: 12, name: 'trial_user', title: 'Trial sub user', description: "トライアル会員の権限定義です", the_role: '{"users":{}}', parent_id: 10, account_type: 'sub_account_user' },
      { id: 20, name: 'system_owner', title: 'System owner', description: "システムオーナーの権限定義です", the_role: '{"users":{}}', parent_id: nil, account_type: 'main_account' },
      { id: 21, name: 'system_owner_admin', title: 'System owner sub admin', description: "システムオーナーの権限定義です", the_role: '{"users":{}}', parent_id: 20, account_type: 'sub_account_admin' },
      { id: 22, name: 'system_owner_user', title: 'System owner sub user', description: "システムオーナーの権限定義です", the_role: '{"users":{}}', parent_id: 20, account_type: 'sub_account_user' }
    ]

    @roles.each do |role|
      Rc::Role.create(role.merge(created_at: Time.now, updated_at: Time.now))
    end
  end
end
