FactoryBot.define do
  factory :post do
    id { 1 }
    content { "Hello" }
    teamname { "ooita" }
    association :user
  end
end
