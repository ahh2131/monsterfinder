class MonstersController < ApplicationController


  skip_before_filter :verify_authenticity_token

  def index
    #render json: Monster.where.not(lat: nil).order('created_at desc')
    #  .where(created_at: 3.hours.ago..Time.now).all.to_json
    #expires_in 5.minutes, :public => true
    m = Monster.near([params[:lat], params[:lng]], 200)
    render json: m
    #render json: File.read("#{Rails.root}/public/monsters.json")


  end

  def create
    # check if name is a real pokemon
    Monster.create(monster_params)
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def search
    if Monster::MONSTERS.include?(params[:monster].titleize)
      render json: Monster.where(name: params[:monster].titleize).all.to_json
    else
      render json: []
    end
  end

  private
  def monster_params
    params.require(:monster).permit(:monster, :name, :lat, :lng)
  end
end
