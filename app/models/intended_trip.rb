class IntendedTrip

  include DataMapper::Resource
  property :id, Serial

  property :on, Enum["weekdays", "weekdays and saturday", "all days"], :required => true

  belongs_to :from_stop, :model => BusStop
  belongs_to :to_stop, :model => BusStop
  belongs_to :user

  property :created_at, DateTime
  property :updated_at, DateTime
  property :deleted_at, ParanoidDateTime

  # accepts_nested_attributes_for :user

  # Public: finds all the trips starting and ending within a particular radius of this trip
  # start_radius -> an Integer, specifying the maximum distance from the start point to search within. Pass nil to ignore
  # end_radius   -> an Integer, specifying the maximum distance from the end point to search within. Pass nil or omit this parameter to ignore
  # 
  # return a DataMapper::Collection of IntendedTrips matching the distance criteria
  def trips_within(start_radius, end_radius = nil)
    return [] unless (start_radius or end_radius)
    start_radius ? from_stop.within(start_radius).trip_starts : IntendedTrip.all(:id.lt => 0)  ||  # empty collection
      end_radius ? to_stop.within(end_radius).trip_ends       : IntendedTrip.all(:id.lt => 0)
  end

  # Public: gets the nearest trips, sorted by a given order
  # params     ->  a Hash with keys for limit and offset. Defaults to {:limit => 20, :offset => 0}
  # sort_order -> one of :from, :to or :total, specifying whether to sort on distance at start, distance at end or total distance. Defaults to :total
  def nearest_trips(params = {}, sort_order = :total)
    params = {:limit => 100, :offset => 0}.merge(params)
    sql = %Q{
      SELECT * FROM 
        (SELECT it.id, bs1.name, bs2.name, bs1.lat AS flat, bs1.lng AS flng, bs2.lat AS tlat, bs2.lng AS tlng, 
                 earth_distance(ll_to_earth(#{self.from_stop.lat},#{self.from_stop.lng}), ll_to_earth(bs1.lat, bs1.lng)) AS fdist, 
                 earth_distance(ll_to_earth(#{self.to_stop.lat},#{self.to_stop.lng}), ll_to_earth(bs2.lat, bs2.lng)) AS tdist 
         FROM intended_trips it LEFT JOIN bus_stops bs1 on it.from_stop_id = bs1.id 
                                LEFT JOIN bus_stops bs2 on it.to_stop_id = bs2.id) AS trip_distances 
      ORDER BY fdist + tdist LIMIT #{params[:limit]} OFFSET #{params[:offset]}; 
      }
    sorted_trips = repository.adapter.select(sql)
    sorted_trips.map{|t| {:trip => IntendedTrip.get(t[:id]), :start_distance => t[:fdist], :end_distance => t[:tdist]} unless t[:id] == self.id}.compact.select{|x| x[:trip]}
  end
  
end
