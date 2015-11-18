class FollowsController < ApplicationController

  def new
    @follow = current_user.follows.new(params[:follower_id])
  end

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
    @user = User.find(params[:id])
    @current_user.stop_following(@user)
    flash[:notice] = "Unfollowed!"
    redirect_to root_path
  end

end
