FactoryBot.define do
  factory :user do
    shop_name { Faker::Name.name  }
    owner_name { Faker::Name.name  }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    owner_phone_number { '00011112222' }
    shop_address { '東京都新宿区'}
    shop_city {'新宿区'}
    email { Faker::Internet.free_email }
   end
end
