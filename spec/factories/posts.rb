FactoryBot.define do
  factory :post do
    association :sender, factory: :user
    association :receiver, factory: :user
    post {"テスト投稿です"}
  end
end
