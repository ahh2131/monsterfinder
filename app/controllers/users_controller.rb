class UsersController < ApplicationController

  def show
  end

  def vote
    # needs uuid to make sure hasnt already voted
    Activity.first_or_create(
      user: User.where(uuid: params[:uuid]).first,
      monster: Monster.find(params[:monster_id]),
      activity_type: which_vote(params[:vote])
    )
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def which_vote
    params[:vote] == 'up' ? 'upvote' : 'downvote'
  end

end
