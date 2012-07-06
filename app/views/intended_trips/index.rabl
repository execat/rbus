collection @intended_trips
attributes :id, :on
node(:from_stop){|f| f.from_stop.attributes }
node(:to_stop){|f| f.to_stop.attributes}