class V3::ChatroomsController < V3::BaseController

  def get_chatroom
    render json: ChatroomBuilder.new(12).render.to_json
  end
end
