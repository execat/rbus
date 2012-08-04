Feature: Filtering trips based on latitude/longitude at start/end
  As a user
  In order to match commuters with similar trips
  I want to filter trips based on their start and stop lat/lng values

  Background:
    Given trips with lat/lng coords of "0,0-> 2,2|0,0->3,3"
    

    Scenario: Filtering some trips
      When I visit the filter page with start box from "0,0|1,1" -> "2,2|2.5,2.5"
      Then I should see "1 trip"
      And I should see element "#map1"
      And I should see element "#map2"

    Scenario: Filtering some other trips
      When I visit the filter page with start box from "0,0|1,1" -> "2.5,2.5|3.5,3.5"
      Then I should see "1 trip"


    Scenario: Filtering no trips
      When I visit the filter page with start box from "10,10|1,1" -> "2.5,2.5|3.5,3.5"
      Then I should see "0 trips"
