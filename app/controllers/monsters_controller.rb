class MonstersController < ApplicationController
  def index
    render json: Monster.order('created_at desc').all.to_json
  end

  def create
    # check if name is a real pokemon
    Monster.create(params[:monster])
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
