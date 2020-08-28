FactoryBot.define do
  factory :notification do
    association :action_user, factory: :user
    association :passive_user, factory: :user
    association :post
    association :post_comment
    action { "" }
    checked { Faker::Boolean.boolean }
  end
end
