class V3::ChatroomsController < V3::BaseController

  def get_chatroom
    render json: ChatroomBuilder.new(2).render.to_json
  end
end
