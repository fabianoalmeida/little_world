require 'spec_helper'

describe Friend do
  
  before( :each ) do
    @friend = FactoryGirl.build( :friend )
  end
  
  context '#name' do
    describe "with invalid params" do
      it "like nil value" do
        @friend.name = nil
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:name)
      end
    
      it "like empty value" do
        @friend.name = ''
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:name)
      end
    end
  end
  
  context '#latitude' do
    describe "with invalid params" do
      it "like nil value" do
        @friend.latitude = nil
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:latitude)
      end
    
      it "like empty value" do
        @friend.latitude = ''
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:latitude)
      end
    end
  end
  
  context '#longitude' do
    describe "with invalid params" do
      it "like nil value" do
        @friend.longitude = nil
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:longitude)
      end
    
      it "like empty value" do
        @friend.longitude = ''
        @friend.should_not be_valid
        @friend.should have(1).errors_on(:longitude)
      end
    end
  end
  
end
