class MonstersController < ApplicationController



  DISTANCE = 10

  skip_before_filter :verify_authenticity_token

  def index
    #render json: Monster.where.not(lat: nil).order('created_at desc')
    #  .where(created_at: 3.hours.ago..Time.now).all.to_json
    #expires_in 5.minutes, :public => true
    m = []
    if coordinates_exist?
      m = if params[:recent] == 'true'
            Monster.recent.near(coordinates, DISTANCE).all
          else
            Monster.near(coordinates, DISTANCE).all
          end
    end
    render json: MonsterBuilder.new(m).render
  end

  def create
    # check if name is a real pokemon
    m = Monster.create(monster_params)
    if params.key?(:uuid)
      Activity.create(uuid: params[:uuid], monster: m, activity_type: "spot")
    end
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def search
    monster = params[:monster].titleize
    if Monster::MONSTERS.include?(monster)
      m = if params[:recent] == 'true'
            Monster.recent.near(coordinates, DISTANCE).where(name: monster).all
          else
            Monster.near(coordinates, DISTANCE).where(name: monster).all
          end
      render json: m.to_json
    else
      render json: []
    end
  end

  def coordinates
    [params[:lat], params[:lng]]
  end

  def coordinates_exist?
    params[:lat].to_f != 0.0 && params[:lng].to_f != 0.0
  end

  private

  def monster_params
    params.require(:monster).permit(:monster, :name, :lat, :lng)
  end
end
