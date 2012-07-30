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
        @friend.should have(2).errors_on(:latitude)
      end
    
      it "like empty value" do
        @friend.latitude = ''
        @friend.should_not be_valid
        @friend.should have(2).errors_on(:latitude)
      end
    end
  end
  
  context '#longitude' do
    describe "with invalid params" do
      it "like nil value" do
        @friend.longitude = nil
        @friend.should_not be_valid
        @friend.should have(2).errors_on(:longitude)
      end
    
      it "like empty value" do
        @friend.longitude = ''
        @friend.should_not be_valid
        @friend.should have(2).errors_on(:longitude)
      end
    end
  end
  
  context 'create' do
    describe 'with double fields #latitude and #longitude' do
      it "that exists" do
        @friend.save
        friend = FactoryGirl.build( :friend, latitude: @friend.latitude, longitude: @friend.longitude )
        friend.should_not be_valid
        friend.should have(1).errors_on(:latitude)
        friend.should have(1).errors_on(:longitude)
      end
    
      it "that doesn't exists" do
        @friend.save
        friend = FactoryGirl.build( :friend )
        friend.should be_valid
        friend.should have(:no).errors_on(:latitude)
        friend.should have(:no).errors_on(:longitude)
      end
    end
  end
  
  context 'search' do
    describe 'nearest friends since a friend location' do
      it "should return four items" do
        @friend.save
        5.times{ FactoryGirl.create( :friend ) }
        friends = Friend.search( @friend.latitude.to_s, @friend.longitude.to_s )
        friends.should have(4).items
      end

      it "should return two items" do
        @friend.save
        1.times{ FactoryGirl.create( :friend ) }
        friends = Friend.search( @friend.latitude.to_s, @friend.longitude.to_s )
        friends.should have(2).items
      end
    end
    
    describe 'nearest friends since a friend #latitude' do
      it "should return four items" do
        @friend.save
        3.times{ FactoryGirl.create( :friend ) }
        friends = Friend.search( @friend.latitude.to_s )
        friends.should have(4).items
      end
    end
  end
  
end
