class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  def show
  end

  def vote
    # needs uuid to make sure hasnt already voted
    u = User.where(uuid: params[:uuid]).first
    m = Monster.find(params[:monster_id])
    a = Activity.where(
      user: u,
      monster: m,
      activity_type: [1, 2]
    ).first
    if a.nil?
      Activity.create(
        user: u,
        monster: m,
        activity_type: which_vote
      )
    end

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def which_vote
    params[:vote] == 'up' ? 'upvote' : 'downvote'
  end

  def create
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :uuid)
  end

end
