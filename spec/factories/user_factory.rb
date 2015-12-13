FactoryGirl.define do
  factory :user do
    email                  { Faker::Internet.email }
    password               { "supersecret" }
    password_confirmation  { "supersecret" }
    admin 								 { false }
  end
end