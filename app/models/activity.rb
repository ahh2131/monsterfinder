class Activity < ActiveRecord::Base
  after_create :update_counter_cache
  after_destroy :update_counter_cache

  belongs_to :monster
  belongs_to :user
  scope :spot, -> { where(activity_type: 0) }
  scope :upVotes, -> { where(activity_type: 1) }
  scope :downVotes, -> { where(activity_type: 2) }
  scope :notifications, -> { where(activity_type: 3 ) }
  validates_inclusion_of :activity_type, :in => ["spot", "upvote", "downvote", "notify"], :allow_nil => false

  VOTE_MINIMUM = 0
  NOTIFICATION_VOTES = 5
  NEARBY_MONSTER_DISTANCE = 5

  enum activity_type: {
    "spot" => 0,
    "upvote" => 1,
    "downvote" => 2,
    "notify" => 3
  }

  def update_counter_cache
    case activity_type
    when "upvote"
      monster.upvote_count = Activity.where(monster: monster).upVotes.count
      update_total_vote_count
      if !monster.seen && monster.total_vote_count == NOTIFICATION_VOTES
        delay.send_notifications(monster)
        monster.seen = true
      end
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

  def send_notifications(monster)
    nearby_users = User.near([monster.lat, monster.lng], NEARBY_MONSTER_DISTANCE)
    if nearby_users.count(:all) > 0
      notifications = Activity.notifications.where(user_id: nearby_users.map(&:id).join(","))
        .where(monster_number: Monster::MONSTERS.index(monster.name))

      airship = Urbanairship::Client.new(key:Figaro.env.ua_application_key, secret:Figaro.env.ua_master_secret)
      push = airship.create_push
      push.notification = Urbanairship.notification(alert: "A monster you are looking for is nearby!")
      push.device_types = Urbanairship.device_types(['ios'])

      push.audience = Urbanairship.or(*notifications.map{ |n| Urbanairship.ios_channel(n.user.channel_id) } )
      push.send_push

      monster.save!
    end
  end


end
