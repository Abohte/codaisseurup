FactoryBot.define do
  factory :event do
    name              { Faker::Lorem.words(3).join(' ') }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          5
    includes_food     false
    includes_drinks   false
    starts_at         DateTime.new(2018,1,15)
    ends_at           DateTime.new(2018,1,16)
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
