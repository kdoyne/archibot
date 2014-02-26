FactoryGirl.define do
  factory :architect do
    name { Faker::Name.name }
    style "contemporary"
  end
end