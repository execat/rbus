module Helpers
  def create_trip_by_latlng(y1, x1, y2, x2)
    FactoryGirl.create(:intended_trip, :from_lat => y1, :from_lng => x1, :to_lat => y2, :to_lng => x2)
  end
end
    
