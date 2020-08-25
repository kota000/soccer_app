FactoryBot.define do
  factory :user do
    username { "test_user" }
    email    { "test@user.co.jp" }
    password { "000000" }
  end
end
