# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#require File.join(Rails.root,'spec','factories.rb')



@t1 = FactoryGirl.create(:intended_trip, :to_lat => 0.1)
debugger
@t2 = FactoryGirl.create(:intended_trip, :from_lat => 0.008, :to_lat => 0.008, :to_lng => 0.1)
@t3 = FactoryGirl.create(:intended_trip, :from_lat => 0.1, :to_lat => 0.108)
