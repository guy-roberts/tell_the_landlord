FactoryBot.define do
  factory :organisation do
    name { Faker::Lorem.word + Faker::Lorem.word + Faker::Lorem.word}
  end
end
