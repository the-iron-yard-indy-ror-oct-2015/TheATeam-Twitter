class UserSessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]
  before_action :require_user, only: [:destroy]

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    current_user_session.find(params[:id])
    current_user_session.destroy
    flash[:notice] = "See you later!"
    redirect_to root_path
  end

end
