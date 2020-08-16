FactoryBot.define do
  factory :post do
    content { "MyText" }
    image { "MyString" }
    user { nil }
  end
end
