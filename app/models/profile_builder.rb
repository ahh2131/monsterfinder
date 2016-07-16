class ProfileBuilder
  attr_accessor :user
  attr_accessor :spots

  def initialize(user, spots)
    self.user = user
    self.spots = spots
  end

  def render
    {
      user: user,
      monsters: MonsterBuilder.new(spots).render,
      totalVotes: spots.map(&:total_vote_count).inject(0, &:+)
    }
  end

end
