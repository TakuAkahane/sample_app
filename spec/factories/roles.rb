FactoryBot.define do
  factory :role do
    name { "MyString" }
    title { "MyString" }
    description { "MyText" }
    the_role { "MyText" }
    parent_id { 1 }
    account_type { "MyString" }
    default_corporate { false }
    default_individual { false }
  end
end
