class UsersController < ApplicationController

  def show
  end

  def vote
    # needs uuid to make sure hasnt already voted
    u = User.where(uuid: params[:uuid]).first
    m = Monster.find(params[:monster_id])
    a = Activity.where(
      user: u,
      monster: m,
      activity_type: ['upvote', 'downvote']
    ).first
    if a.nil?
      Activity.create(
        user: u,
        monster: m,
        activity_type: 'upvote'
      )
    end

    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def which_vote
    params[:vote] == 'up' ? 'upvote' : 'downvote'
  end

end
