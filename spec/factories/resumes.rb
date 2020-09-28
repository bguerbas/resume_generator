FactoryBot.define do
  factory :resumes do
    user { create(:user) }
    personal_info { create(:personal_info) }
  end
end
