# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    sequence(:name)      { |n| "Name#{n}" }
    sequence(:latitude)  { |n| n }
    sequence(:longitude) { |n| n }
  end
end
