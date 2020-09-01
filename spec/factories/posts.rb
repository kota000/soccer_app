FactoryBot.define do
  factory :post, class: Post do
    id { 1 }
    content { "Hello" }
    teamname { "ooita" }
    association :user
  end
end
