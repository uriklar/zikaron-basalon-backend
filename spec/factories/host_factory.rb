require 'faker'
FactoryGirl.define do
  factory :host do
    address Faker::Address.street_address

    after(:create) do |host|
      create(:user, meta: host)
    end

  end
end