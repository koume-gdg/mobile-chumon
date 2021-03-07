FactoryBot.define do
  factory :user do
    shop_name { Faker::Name.name }
  end
end
