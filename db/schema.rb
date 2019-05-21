# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_21_232511) do

  create_table "buy_investment_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false, comment: "物件名"
    t.integer "ward_id", null: false, comment: "区ID"
    t.string "address", null: false, comment: "住所"
    t.integer "price", null: false, comment: "金額"
    t.string "floore_plan", null: false, comment: "間取り"
    t.integer "floore_size", null: false, comment: "専有面積"
    t.integer "floore_level", null: false, comment: "階数"
    t.datetime "completion_date", null: false, comment: "建築日"
    t.string "property_type", null: false, comment: "住居タイプ"
    t.integer "balcony_size", comment: "ベランダ面積"
    t.string "balcony_direction", null: false, comment: "ベランダ向き"
    t.integer "total_number_of_houses", null: false, comment: "総住戸数"
    t.string "rights_concening_land", null: false, comment: "権利"
    t.string "management_company", comment: "管理会社名"
    t.integer "management_fee", null: false, comment: "管理費"
    t.integer "repair_reserve_fund", null: false, comment: "修繕積立金"
    t.datetime "handover_date", null: false, comment: "引き渡し日"
    t.text "transportation", null: false, comment: "交通手段"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buy_residential_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "property_name", null: false
    t.string "ward_id", limit: 15, null: false, comment: "区ID"
    t.string "address", null: false, comment: "住所"
    t.integer "price", null: false, comment: "金額"
    t.string "floore_plan", null: false, comment: "間取り"
    t.integer "floore_size", null: false, comment: "専有面積"
    t.integer "floore_level", null: false, comment: "階数"
    t.datetime "completion_date", null: false, comment: "建築日"
    t.string "property_type", null: false, comment: "住居タイプ"
    t.integer "balcony_size", comment: "ベランダ面積"
    t.string "balcony_direction", null: false, comment: "ベランダ向き"
    t.integer "total_number_of_houses", null: false, comment: "総住戸数"
    t.string "rights_concening_land", null: false, comment: "権利"
    t.string "management_company", comment: "管理会社名"
    t.integer "management_fee", null: false, comment: "管理費"
    t.integer "repair_reserve_fund", null: false, comment: "修繕積立金"
    t.datetime "handover_date", null: false, comment: "引き渡し日"
    t.text "transportation", null: false, comment: "交通手段"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "ward_id", null: false, comment: "区ID"
    t.string "address", null: false, comment: "住所詳細"
    t.string "name", null: false, comment: "名前"
    t.integer "tel", null: false, comment: "電話番号"
    t.string "public", null: false, comment: "公開/非公開"
    t.integer "establishment", comment: "設立年"
    t.text "description", comment: "概要"
    t.boolean "deleted", default: false, comment: "削除フラグ"
    t.string "company_size_id", comment: "企業規模識別子"
    t.integer "user_parent_id", null: false, comment: "親ユーザID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "site_url", limit: 1026, comment: "会社HPのURL"
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "inquirytype", limit: 30, comment: "問い合わせ種類"
    t.string "company", limit: 50, comment: "会社名"
    t.string "first_name", limit: 30, comment: "姓"
    t.string "last_name", limit: 30, comment: "名"
    t.string "email", comment: "メールアドレス"
    t.string "tel", limit: 11, comment: "電話番号"
    t.text "content", comment: "問い合わせ内容"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investment_property_search_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "user_id", comment: "ユーザID"
    t.text "params", comment: "パラメータ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "residential_property_search_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "user_id", comment: "ユーザID"
    t.text "params", comment: "パラメータ"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", limit: 30, comment: "権限名（システム）"
    t.string "title", limit: 30, comment: "権限名（日本語）"
    t.text "description", comment: "権限の概要"
    t.text "the_role", comment: "権限設定"
    t.integer "parent_id", comment: "権限の親ID"
    t.string "account_type", comment: "アカウント種類"
    t.integer "default_corporate", limit: 1, comment: "デフォルト設定（会社）"
    t.boolean "default_individual", comment: "デフォルト設定（個人）"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "name", null: false, comment: "物件名"
    t.integer "ward_id", null: false, comment: "区ID"
    t.string "address", null: false, comment: "住所"
    t.integer "price", null: false, comment: "金額"
    t.string "floore_plan", null: false, comment: "間取り"
    t.integer "floore_size", null: false, comment: "専有面積"
    t.integer "floore_level", null: false, comment: "階数"
    t.datetime "completion_date", null: false, comment: "建築日"
    t.string "property_type", null: false, comment: "住居タイプ"
    t.integer "balcony_size", comment: "ベランダ面積"
    t.string "balcony_direction", null: false, comment: "ベランダ向き"
    t.integer "total_number_of_houses", null: false, comment: "総住戸数"
    t.string "rights_concening_land", null: false, comment: "権利"
    t.string "management_company", comment: "管理会社名"
    t.integer "management_fee", null: false, comment: "管理費"
    t.integer "repair_reserve_fund", null: false, comment: "修繕積立金"
    t.datetime "handover_date", null: false, comment: "引き渡し日"
    t.text "transportation", null: false, comment: "交通手段"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "site_title", limit: 50, comment: "サイトタイトル"
    t.boolean "maintenance_mode_flg", comment: "メンテナンスモードフラグ"
    t.text "maintenance_description", comment: "メンテナンス中の説明書き"
    t.string "allow_access_ip_under_maintenance", limit: 15, comment: "メンテナンス中にアクセス出来るIP"
    t.boolean "stop_send_mail_batch_flg", comment: "メールバッチ送信停止フラグ"
    t.string "allow_access_system_admin_ip", limit: 15, comment: "システムアドミンにアクセス出来るIP"
    t.string "mail_from", limit: 30, comment: "メール送信元アドレス"
    t.string "mail_admin_to", limit: 30, comment: "アドミンメールアドレス"
    t.string "secretarist", limit: 50, comment: "事務局名"
    t.text "mail_signature_default", comment: "メール署名デフォルト"
    t.text "mail_signature_admin", comment: "メール署名管理版"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "standard_plan_main_role_id", comment: "スタンダードプランメインユーザID"
    t.integer "light_plan_main_role_id", comment: "ライトプランメインユーザID"
    t.integer "trial_plan_main_role_id", comment: "トライアルプランメインユーザID"
    t.integer "system_owner_main_role_id", comment: "システムオーナーメインユーザID"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false, comment: "email - SNS認証時取込有"
    t.string "encrypted_password", default: "", null: false, comment: "暗号化パスワード"
    t.string "reset_password_token", comment: "パスワード再設定用トークン"
    t.datetime "reset_password_sent_at", comment: "パスワード再設定用トークン送信日時"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false, comment: "サインイン回数"
    t.datetime "current_sign_in_at", comment: "最新サインイン日時"
    t.datetime "last_sign_in_at", comment: "最新1つ前のサインイン日時"
    t.string "current_sign_in_ip", comment: "最新サインインIP"
    t.string "last_sign_in_ip", comment: "最新1つ前のサインインIP"
    t.string "confirmation_token", comment: "確認用トークン"
    t.datetime "confirmed_at", comment: "確認完了日時"
    t.datetime "confirmation_sent_at", comment: "確認メール送信日時"
    t.string "unconfirmed_email", comment: "未確認メールアドレス"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at", comment: "ロックアウト日時"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider", comment: "omniauth判定用"
    t.string "uuid", comment: "user id"
    t.string "name", comment: "ユーザ名"
    t.integer "company_id", comment: "会社ID"
    t.boolean "individual_use", comment: "個人利用フラグ"
    t.string "last_name", limit: 30, comment: "姓"
    t.string "first_name", limit: 30, comment: "名"
    t.string "tel", limit: 45, comment: "電話番号"
    t.string "display_name", limit: 30, comment: "表示名"
    t.string "password", limit: 50, comment: "パスワード"
    t.boolean "incomplete_sns_registration", comment: "snsを使った会員登録プロセスフラグ"
    t.integer "role_id", comment: "権限ID"
    t.integer "parent_id", comment: "親ユーザID"
    t.boolean "db_auth_registration_completed", comment: "DB認証利用ユーザ登録フラグ"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
