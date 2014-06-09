require 'faker'

FactoryGirl.define do
  factory :user do
    username "factorytest"
    password "password"
  
    factory :invalid_user do
      username nil
    end
  end
end