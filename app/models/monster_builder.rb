include ActionView::Helpers::DateHelper
class MonsterBuilder
  attr_accessor :monsters

  def initialize(monsters)
    self.monsters = monsters
  end

  def render
    monsters.map do |monster|
      {
        id: monster.id,
        name: monster.name,
        lat: monster.lat,
        lng: monster.lng,
        created_at: monster.created_at,
        number: monster.number,
        spotterName: monster.activities.spot.first&.user&.name || getExpiresAt(monster),
        upVotes: monster.upvote_count,
        downVotes: monster.downvote_count,
        totalVotes: monster.total_vote_count,
        expiresAt: monster.expires_at || "",
        # circles are annoying
        verified: false
      }
    end
  end

  def getExpiresAt(monster)
    if monster.expires_at
      return "Expires at: " + monster.expires_at.in_time_zone("Eastern Time (US & Canada)").strftime("%I:%M%p, %b %e") + " EST"
    else
      return ""
    end
  end
end
