FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
    subdomain { Faker::Lorem.word.downcase }
  end
end
