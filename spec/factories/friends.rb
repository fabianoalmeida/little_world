# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence :name do |n|
    "Name#{n}"
  end
  
  sequence :number do |n|
    n
  end
  
  factory :friend do
    name FactoryGirl.generate(:name)
    latitude FactoryGirl.generate(:number)
    longitude FactoryGirl.generate(:number)
  end
end
