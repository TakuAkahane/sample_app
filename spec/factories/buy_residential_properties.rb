FactoryBot.define do
  factory :buy_residential_property do
    name { "MyString" }
    ward_id { 1 }
    address { "MyString" }
    price { 1 }
    floore_plan { "MyString" }
    floore_size { 1 }
    floore_level { 1 }
    completion_date { "2019-03-13 22:45:48" }
    property_type { "MyString" }
    balcony_size { 1 }
    balcony_direction { "MyString" }
    total_number_of_houses { 1 }
    rights_concening_land { "MyString" }
    management_company { "MyString" }
    management_fee { 1 }
    repair_reserve_fund { 1 }
    handover_date { "2019-03-13 22:45:48" }
    transportation { "MyText" }
  end
end
