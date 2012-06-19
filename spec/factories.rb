FactoryGirl.define do

  sequence(:bus_stop_name) { |n| "bus_stop #{n}"}
  
  factory :bus_stop do
    lat   0
    lng   0
    name  { generate(:bus_stop_name) }
  end


end
