class FollowsController < ApplicationController

  def create
    @follow = current_user.follows.new(params[:follower_id])
    if @follow.save
      flash[:notice] = "Followed"
      redirect_to root_path
    else
      flash[:notice] = "Follow unsuccessful"
      redirect_to root_path
    end
  end

  def destroy
    @follow = current_user.follows.find(params[:id])
    @follow.destroy
    flash[:notice] = "Unfollowed!"
    redirect_to root_path
  end

end
