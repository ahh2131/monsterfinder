class V4::ChatroomsController < V4::BaseController

  def get_chatroom
    lat = params[:lat]
    lng = params[:lng]
    u = User.where(uuid: params[:uuid]).first
    if u
      u.lat = lat
      u.lng = lng
      u.save
    end
    render json: ChatroomBuilder.new(lat, lng).render.to_json
  end
end
