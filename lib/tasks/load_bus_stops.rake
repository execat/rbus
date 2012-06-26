require 'debugger'
namespace :data do
  task :load_bus_stops => :environment do
    y = YAML::load_file(File.join(Rails.root, "db","bus_stops.yml"))
    y.each do |bs|
      bs.delete("id")
      b = BusStop.create!(bs)
      puts b.id
    end
  end
end
