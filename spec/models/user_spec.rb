require 'spec_helper'

describe User do
  it { should have_property(:role).of_type(DataMapper::Property::String)}
  it {should have_many(:intended_trips)}
  it {should have_many(:bus_stops)}
  describe "admin user" do
    before :all do
      @admin = FactoryGirl.create(:admin_user)
    end
    
    it "should answer admin? properly" do
      @admin.admin?.should be_true
    end


  end
end
