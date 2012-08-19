class IntendedTrip

  include DataMapper::Resource
  property :id, Serial

  property :on, Enum["weekdays", "weekdays and saturday", "all days"], :required => true

  property :from_name, String, :required => true
  property :from_lat, Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90
  property :from_lng, Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90

  property :to_name, String, :required => true
  property :to_lat, Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90
  property :to_lng, Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90


  belongs_to :user

  property :created_at, DateTime
  property :updated_at, DateTime
  property :deleted_at, ParanoidDateTime

  # accepts_nested_attributes_for :user

  # Public: finds all the trips starting and ending within a particular radius of this trip
  # meters -> the radius within which to search. currently returns trips where the sum of the start distance and end distance is less than this parameter
  def trips_within(meters)
    f = distance(:from)
    t = distance(:to)
    trips_with_distance.where{(f + t <= meters)}.exclude(:id => self.id).all
  end

  # Public: gets the nearest trips, sorted by a given order
  # params     ->  a Hash with keys for limit and offset. Defaults to {:limit => 20, :offset => 0}
  # sort_order -> one of :from, :to or :total, specifying whether to sort on distance at start, distance at end or total distance. Defaults to :total
  def nearest_trips(params = {}, sort_order = :total)
    params = {:limit => 100, :offset => 0}.merge(params)
    sorted_trips = trips_with_distance.order(distance(:from) + distance(:to))
    sorted_trips.map{|t| {
        :trip => IntendedTrip.get(t[:id]), 
        :start_distance => t[:fdist], 
        :end_distance => t[:tdist], 
        :total_distance => t[:fdist] + t[:tdist]
      } unless t[:id] == self.id}.compact.select{|x| x[:trip]}
  end



  # Public: return trips that match the given lat/lng filters
  # options  -> a Hash with the following keys
  #     from ->  a Hash with keys lat1, lng1, lat2, lng2 representing the coordinates within which the trip must start
  #     to   ->  a Hash with keys lat1, lng1, lat2, lng2 representing the coordinates within which the trip must start
  # returns a DataMapper::Collection of IntendedTrips
  # example: Trip.filter(:from => {:lat1 => 19, :lng1 => 72, :lat2 => 20, :lng2 => 73})
  def self.filter(options = nil)
    return self.all unless options
    q = {}
    if f = options[:from]
      q[:from_lat.gte] = f[:lat1]
      q[:from_lng.gte] = f[:lng1]
      q[:from_lat.lte] = f[:lat2]
      q[:from_lng.lte] = f[:lng2]
    end
    if t = options[:to]
      q[:to_lat.gte] = t[:lat1]
      q[:to_lng.gte] = t[:lng1]
      q[:to_lat.lte] = t[:lat2]
      q[:to_lng.lte] = t[:lng2]
    end
    self.all(q)
  end

  def inspect
    "[#{id}: from #{from_name}(#{from_lat},#{from_lng}) to #{to_name}(#{to_lat},#{to_lng}) on #{on}]"
  end


  private

  # Returns all the other trips in the database with their fdist and tdist calculated
  def trips_with_distance
    DB[:intended_trips].select(:id, :from_name, :to_name, 
                               :from_lat, :from_lng,
                               :to_lat, :to_lng,
                               distance(:from).as(:fdist),
                               distance(:to).as(:tdist)
                               )
  end

  # Returns a Sequel.function to calculate the distance between a trip and all other trips
  def distance(what)
    lat, lng = "#{what}_lat".to_sym, "#{what}_lng".to_sym
    Sequel.function(:earth_distance, 
                    Sequel.function(:ll_to_earth, self.send(lat), self.send(lng)),
                    Sequel.function(:ll_to_earth, lat, lng)
                    )
  end

  
end
