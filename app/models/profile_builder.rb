class ProfileBuilder

  def initialize(user, spots)
    self.user = user
    self.spots = spots
  end

  def render
    {
      user: user,
      monsters: spots
    }
  end

end
