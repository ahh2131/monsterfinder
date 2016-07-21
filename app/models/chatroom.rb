class Chatroom < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :lng

end
