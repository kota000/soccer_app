FactoryBot.define do
  factory :user, class: User do
    id       { 1 }
    username { "test_user" }
    email    { "test@user.co.jp" }
    password { "000000" }
  end
end
