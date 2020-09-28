FactoryBot.define do
  factory :personal_info do
    full_name { Faker::Name.name }
    age { rand(14..120) }
    sex { %w[feminino masculino].sample }
    nationality { Faker::Nation.nationality }
    civil_status { %w[casado(a) viuvo(a) separado(a) divorciado(a) solteiro(a)].sample }
  end
end
