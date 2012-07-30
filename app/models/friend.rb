class Friend < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  
  validates :name, :latitude, :longitude, :presence => true

  validates :latitude,
            :numericality => true,
            :uniqueness => { :scope => :longitude }

  validates :longitude,
            :numericality => true,
            :uniqueness => { :scope => :latitude }
  
  def self.search( latitude = nil, longitude = nil )
    
    if latitude.nil? & longitude.nil?
      return all
    end
    
    friends = []
    
    friends = where( 'latitude = ?', latitude.to_i )   unless latitude.empty?
    friends = where( 'longitude = ?', longitude.to_i ) unless longitude.empty?
    friends = where( 'latitude = ? and longitude = ?', latitude.to_i, longitude.to_i ) unless latitude.empty? | longitude.empty?
    
    friends << near_to( friends.first ) unless friends.empty?
    
    friends.limit(3)
  end
  
  private
  
  def self.near_to( friend )
    
    lat_begin = friend.latitude / 1000
    lat_end = friend.latitude * 1000
    
    long_begin = friend.longitude / 1000
    long_end = friend.longitude * 1000
    
    where( 'latitude between ? and ? and longitude between ? and ?', 
        lat_begin, lat_end, long_begin, long_end )
  end

end
