class Friend < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  
  validates :name, :latitude, :longitude, :presence => true

  validates :latitude,
            :numericality => true,
            :uniqueness => { :scope => :longitude }

  validates :longitude,
            :numericality => true,
            :uniqueness => { :scope => :latitude }
  
  def search( latitude=nil, longitude=nil )
    
  end

end
