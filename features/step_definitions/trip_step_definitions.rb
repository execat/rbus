Given /^trips with lat\/lng coords of "(.*?)"$/ do |coords|
  repository.adapter.execute("truncate table bus_stops cascade")
  coords.split("|").map do |coord|
    coord.split("->").map do |pair|
      pair.split(",").map{|p| p.to_f}
    end
  end.each do |pair|
    bs1 = FactoryGirl.create(:bus_stop, :lat => pair[0][0], :lng => pair[0][1])
    bs2 = FactoryGirl.create(:bus_stop, :lat => pair[1][0], :lng => pair[1][1])
    t = FactoryGirl.create(:intended_trip, :from_stop => bs1, :to_stop => bs2)
    puts "adding trip: #{t.inspect}"
  end
end
