class PostsController < ApplicationController
  
  def index
    @posts = Post.all
<<<<<<< HEAD
  end
=======

end
>>>>>>> 0e4c5ffb03c0f6eeed260e8321d772e40ec6a4b5

  def create
    @post = Post.new(post_params)
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
