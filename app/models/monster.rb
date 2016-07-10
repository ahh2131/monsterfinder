class Monster < ActiveRecord::Base
  validates :name, :lat, :lng, presence: true
end
