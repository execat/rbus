require 'dm-types'

migration 1, :denormalize do

  up do
    modify_table :intended_trips do
      add_column :from_name, String, :length => 200, :required => true
      add_column :from_lat, DataMapper::Property::Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90, :default => 0
      add_column :from_lng, DataMapper::Property::Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90, :default => 0
      add_column :to_name, String, :length => 200, :required => true
      add_column :to_lat, DataMapper::Property::Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90, :default => 0
      add_column :to_lng, DataMapper::Property::Decimal, :precision => 18, :scale => 15, :required => true, :max => 90, :min => -90, :default => 0
    end
    execute "UPDATE intended_trips set from_name = (SELECT name FROM bus_stops WHERE id = from_stop_id);"
    execute "UPDATE intended_trips set from_lat = (SELECT lat FROM bus_stops WHERE id = from_stop_id);"
    execute "UPDATE intended_trips set from_lng = (SELECT lng FROM bus_stops WHERE id = from_stop_id);"
    execute "UPDATE intended_trips set to_name = (SELECT name FROM bus_stops WHERE id = to_stop_id);"
    execute "UPDATE intended_trips set to_lat = (SELECT lat FROM bus_stops WHERE id = to_stop_id);"
    execute "UPDATE intended_trips set to_lng = (SELECT lng FROM bus_stops WHERE id = to_stop_id);"
    execute "ALTER TABLE intended_trips ALTER from_lat DROP DEFAULT"
    execute "ALTER TABLE intended_trips ALTER from_lng DROP DEFAULT"
    execute "ALTER TABLE intended_trips ALTER to_lat DROP DEFAULT"
    execute "ALTER TABLE intended_trips ALTER to_lng DROP DEFAULT"
    execute "ALTER TABLE intended_trips ALTER from_name SET NOT NULL"
    execute "ALTER TABLE intended_trips ALTER to_name SET NOT NULL"
    execute "ALTER TABLE intended_trips ALTER from_lat SET NOT NULL"
    execute "ALTER TABLE intended_trips ALTER from_lng SET NOT NULL"
    execute "ALTER TABLE intended_trips ALTER to_lat SET NOT NULL"
    execute "ALTER TABLE intended_trips ALTER to_lng SET NOT NULL"
    modify_table :intended_trips do
      drop_column :from_stop_id
      drop_column :to_stop_id
    end

  end
end
