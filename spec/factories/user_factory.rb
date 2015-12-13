FactoryGirl.define do
  factory :user do
    email                  { Faker::Internet.email }
    password               { "supersecret" }
    password_confirmation  { "supersecret" }
    association :meta
  end
end