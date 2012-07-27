module Helpers
  def create_trip_by_latlng(y1, x1, y2, x2)
    bs1 = FactoryGirl.create(:bus_stop, :lat => x1, :lng => y1)
    bs2 = FactoryGirl.create(:bus_stop, :lat => x2, :lng => y2)
    FactoryGirl.create(:intended_trip, :from_stop => bs1, :to_stop => bs2)
  end
end
    
