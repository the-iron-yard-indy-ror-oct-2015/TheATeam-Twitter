class PostsController < ApplicationController
  def index
    @posts = Post.all

end

  def create
    @post = Post.create(:message => params[:message])
    respond to do |format|
      if @post.save
        format.html { redirect_to posts_path}
      else
        flash[:notice] = "Message failed to save"
        format.html { redirect_to posts_path}

      end

    end

  end

end
