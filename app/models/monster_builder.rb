class MonsterBuilder

  attr_accessor :monsters

  def initialize(monsters)
    self.monsters = monsters
  end

  def render
    monsters.map do |monster|
      {
        name: monster.name,
        lat: monster.lat,
        lng: monster.lng,
        created_at: monster.created_at,
        number: monster.number,
        spotterName: monster.activities.spot.first&.uuid || "",
        upVotes: monster.activities.upVotes.count,
        downVotes: monster.activities.downVotes.count
      }
    end.to_json
  end
end
