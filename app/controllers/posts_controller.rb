class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        flash[:success] = "Thanks for sharing!"
        redirect_to root_path
      else
        flash[:notice] = "Message failed to save."
        render :new
      end
    end

  private

  def post_params
    params.require(:post).permit(:message)
  end

end
