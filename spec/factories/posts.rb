FactoryBot.define do
  factory :post do
    content { "Hello" }
    teamname { "ooita" }
    association :user
  end
end
