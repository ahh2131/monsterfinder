class Activity < ActiveRecord::Base
  belongs_to :monster

  scope :spot, -> { where(activity_type: 0) }
  scope :upVotes, -> { where(activity_type: 1) }
  scope :downVotes, -> { where(activity_type: 2) }
  validates_inclusion_of :activity_type, :in => ["spot", "upvote", "downvote"], :allow_nil => false

  enum activity_type: {
    "spot" => 0,
    "upvote" => 1,
    "downvote" => 2
  }


end
