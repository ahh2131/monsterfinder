class ChatroomBuilder
  attr_accessor :chatroom

  def initialize(chatroom)
    self.chatroom = chatroom
  end

  def render
    {
      chatroom: chatroom
    }
  end
end
