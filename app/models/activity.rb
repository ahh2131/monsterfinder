class Activity < ActiveRecord::Base
  belongs_to :monster

  scope :spots, -> { where(activity_type: 0) }

  validates_inclusion_of :activity_type, :in => ["spot"], :allow_nil => false

  enum activity_type: {
    "spot" => 0
  }


end
