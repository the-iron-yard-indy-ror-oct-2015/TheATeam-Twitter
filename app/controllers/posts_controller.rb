class PostsController < ApplicationController

  def index
    @posts = Post.page(params[:page]).per(10)
  end

  def create
    @post = Post.new(post_params)
      if @post.save
        format.html { redirect_to posts_path}
      else
        flash[:notice] = "Message failed to save"
        render :new
      end
  end

end
