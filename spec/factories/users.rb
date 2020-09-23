FactoryBot.define do
  factory :user do
    login { Faker::Internet.unique.username[1..10] }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password[2..10] }
  end
end
