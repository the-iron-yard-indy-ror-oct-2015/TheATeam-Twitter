class PostsController < ApplicationController

  def index
  
    @posts = Post.order("created_at DESC").page(params[:page]).per(10)

  end

  def create
    @post = Post.new(post_params)
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
        format.html { redirect_to post_path}
        redirect_to root_path
      else
        flash[:notice] = "Message failed to save"
        render :new
      end
    end



def update

  end

private

def set_post
      @post = Post.find(params[:id])

    end

def post_params
  params.require(:post).permit(:user_name, :url, :message)
end
def check_if_current_user_is_owner
  @post = Post.find(params[:id])
  unless @post.user == @current_user
    redirect_to root_url
  end
end
end
