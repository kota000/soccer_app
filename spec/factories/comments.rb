FactoryBot.define do
  factory :comment do
    association :post, factory: :post
    content { 'Test Content' }
  end
end
