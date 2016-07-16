class User < ActiveRecord::Base
  has_many :activities
  has_many :monsters, -> { where activities: { activity_type: 0 } }, through: :activities
end
