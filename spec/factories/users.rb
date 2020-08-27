FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number: 10)}
    first_name { Faker::Lorem.characters(number: 10) }
    last_name_kana { "スペック" }
    first_name_kana { "テスト" }
    email { |n| "test#{n}@example.com" }
    department_id { 1 }
    password { "password" }
    password_confirmation { "password" }
  end
end
