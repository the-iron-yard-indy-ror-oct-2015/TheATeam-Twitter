class UsersController < ApplicationController

  before_action :require_no_user, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.active = true
    @user.approved = true
    @user.confirmed = true
    if @user.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to root_path
    else
      render :new
    end
  end

  def follow
    @user = User.find(params[:id])
    if current_user
      current_user.follow(@user)
      redirect_to root_path
    else
      flash[:notice] = "Please log in to follow other users."
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
