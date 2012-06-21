class BusStop
  
  # this class models bus stops. A bus stop has a name and a lat, lng
  # later, it can also perhaps belong to routes and so on but for now we're keeping it simple
  
  include DataMapper::Resource

  property :id, Serial
  
  property :lat, Decimal, :precision => 10, :scale => 7, :required => true, :max => 90, :min => -90
  property :lng, Decimal, :precision => 10, :scale => 7, :required => true, :max => 180, :min => -180
  property :name, String, :required => true

  has n, :trip_starts, :model => IntendedTrip, :child_key => [:from_stop_id]
  has n, :trip_ends,   :model => IntendedTrip, :child_key => [:to_stop_id]

  # Public: all the trips for this stop
  # conditions -> a Hash of datamapper query conditions
  #
  # example: @bus_stop.trips(:on => :weekdays)
  def trips(conditions = {})
    trip_starts.all(conditions) + trip_ends.all(conditions)
  end


  # Public: Find all bus stops within a particular radius from this one
  # x    -> an Integer, specifying the radius on the circle in meters
  #
  # POSTGRES FTW!
  def within(x)
    BusStop.within(x, self.lat, self.lng) - self
  end

  # Public: Finds all bus stops within a particular radius from a point
  # x     -> an Integer, specifying the radius of the circle in meters
  # lat   -> the latitude of the center of the circle
  # lng   -> the longitude of the center of the circle
  def self.within(x, lat, lng)
    BusStop.all(:conditions => ["earth_distance(ll_to_earth(lat, lng), ll_to_earth(#{lat},#{lng})) <= ?", x]) 
  end

  

end
