class User < ActiveRecord::Base
  geocoded_by :address, :latitude  => :lat, :longitude => :lng

  has_many :activities
  has_many :monsters, -> { where activities: { activity_type: 0 } }, through: :activities
end
