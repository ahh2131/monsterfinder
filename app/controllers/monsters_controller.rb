class MonstersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    render json: Monster.order('created_at desc').all.to_json
  end

  def create
    # check if name is a real pokemon
    Monster.create(params[:monster])
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
  private
  def monaster_params
    params.require(:monster).permit(:name, :lat, :lng)
  end
end
