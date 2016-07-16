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
      monsters: MonsterBuilder.new(spots).render
    }
  end

end
