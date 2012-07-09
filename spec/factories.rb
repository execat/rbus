FactoryGirl.define do

  sequence(:bus_stop_name) { |n| "bus_stop #{n}" }
  sequence(:email)         { |n| "user#{n}@email.com" }

  factory :bus_stop do
    lat   0
    lng   0
    name  { generate(:bus_stop_name) }
    association :user

    factory :from_stop do
    end

    factory :to_stop do
    end
  end

  factory :user do
    email     { generate :email }
    password "s3cr3t"

    factory :admin_user do
      role "admin"
    end
  end

  factory :intended_trip do
    on          :weekdays
    association :from_stop
    association :to_stop
    association :user
    
  end
end
