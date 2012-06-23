require 'spec_helper'

describe User do
  it { should have_property(:role).of_type(DataMapper::Property::String)}
  
  describe "admin user" do
    before :all do
      @admin = FactoryGirl.create(:admin_user)
    end
    
    it "should answer admin? properly" do
      @admin.admin?.should be_true
    end
  end
end
