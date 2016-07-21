class ChatroomBuilder
  attr_accessor :chatroom_id

  def initialize(lat, lng)
    cr = Chatroom.near([lat, lng], 0.25)
    .where("last_joined_at > ?", Time.now - 30.minutes).first
    if !cr
      cr = Chatroom.create(lat: lat, lng: lng)
    end
    cr.last_joined_at = Time.now
    cr.save
    self.chatroom_id = cr.id
  end

  def render
    {
      chatroom: chatroom_id
    }
  end
end
