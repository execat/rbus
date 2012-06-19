class IntendedTrip

  include DataMapper::Resource

  property :id, Serial

  property :on, Enum[:weekdays, :weekdays_and_saturday, :all_days], :required => true

  belongs_to :from_stop, :model => BusStop
  belongs_to :to_stop, :model => BusStop

end
