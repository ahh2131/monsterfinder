class V3::ChatroomsController < V3::BaseController

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
