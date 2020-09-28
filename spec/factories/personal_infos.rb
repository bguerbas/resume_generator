FactoryBot.define do
  factory :personal_info do
    full_name { Faker::Name.name }
    age { Faker::Number.between(from: 14, to: 120) }
    sex { %i[ female masculine].sample(random: SecureRandom) }
    nationality { Faker::Nation.nationality }
    civil_status { %i[ married widowed separated divorced single].sample(random: SecureRandom) }
  end
end
