require 'spec_helper'

describe IntendedTrip do

  it {should have_property(:on) }
  it {should belong_to(:to_stop) }
  it {should belong_to(:from_stop) }

  it { should validate_presence_of(:on)}

end
