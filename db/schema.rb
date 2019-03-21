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

ActiveRecord::Schema.define(version: 2019_03_21_040110) do

  create_table "buy_residential_properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "property_name", null: false
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

end
