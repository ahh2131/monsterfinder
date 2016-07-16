class Activity < ActiveRecord::Base
  after_create :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :monster
  belongs_to :user
  scope :spot, -> { where(activity_type: 0) }
  scope :upVotes, -> { where(activity_type: 1) }
  scope :downVotes, -> { where(activity_type: 2) }
  validates_inclusion_of :activity_type, :in => ["spot", "upvote", "downvote"], :allow_nil => false

  VOTE_MINIMUM = -5

  enum activity_type: {
    "spot" => 0,
    "upvote" => 1,
    "downvote" => 2
  }

  def update_counter_cache
    case activity_type
    when "upvote"
      monster.upvote_count = Activity.where(monster: monster).upVotes.count
      update_total_vote_count
      monster.save!
    when "downvote"
      monster.downvote_count = Activity.where(monster: monster).downVotes.count
      update_total_vote_count
      monster.save!
    end
  end

  def update_total_vote_count
    monster.total_vote_count = monster.upvote_count - monster.downvote_count
    if monster.total_vote_count < VOTE_MINIMUM
      monster.active = false
    end
  end


end
