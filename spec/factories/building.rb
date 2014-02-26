FactoryGirl.define do
  factory :building do
    name { Faker::Name.name }
    address { Faker::Address.street_address(include_secondary = false) }
    association :architect
  end
end