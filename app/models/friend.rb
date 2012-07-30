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
    
    friends = where( 'latitude = ?', latitude.to_i )   unless latitude.to_s.empty?
    friends = where( 'longitude = ?', longitude.to_i ) unless longitude.to_s.empty?
    friends = where( 'latitude = ? and longitude = ?', latitude.to_i, longitude.to_i ) unless latitude.to_s.empty? | longitude.to_s.empty?
    
    friends = near_to( friends.first ) unless friends.empty?
    
    friends.limit(4)
  end
  
  private
  
  def self.near_to( friend )
    radius = Math.exp(Math.cos(friend.latitude))
    
    select(:id)
    .select(:name)
    .select(:latitude)
    .select(:longitude)
    .select(:created_at)
    .select("((#{friend.latitude} - latitude) * (#{friend.latitude} - latitude) + (#{friend.longitude} - longitude) * (#{friend.longitude} - longitude) * #{radius})  as distance")
    .order("distance")
  end

end
