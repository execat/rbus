When /^I visit the filter page with start box from "(.*?)" \-> "(.*?)"$/ do |start_coords, end_coords|
  lat1, lng1, lat2, lng2 = start_coords.split("|").map{|c| c.split(",")}.flatten.map(&:to_f)
  from = {:lat1 => lat1, :lng1 => lng1, :lat2 => lat2, :lng2 => lng2}
  lat1, lng1, lat2, lng2 = end_coords.split("|").map{|c| c.split(",")}.flatten.map(&:to_f)
  to = {:lat1 => lat1, :lng1 => lng1, :lat2 => lat2, :lng2 => lng2}
  visit intended_trips_path({:from => from, :to => to})
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see element "(.*?)"$/ do |arg1|
  page.should have_selector(arg1)
end
