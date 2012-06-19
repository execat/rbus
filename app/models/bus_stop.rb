class BusStop

  include DataMapper::Resource

  property :id, Serial
  
  property :lat, Decimal, :precision => 10, :scale => 7, :required => true, :max => 90, :min => -90
  property :lng, Decimal, :precision => 10, :scale => 7, :required => true, :max => 180, :min => -180
  property :name, String, :required => true

end
