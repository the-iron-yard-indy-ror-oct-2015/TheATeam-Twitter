class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, ]

  def index
    @posts = Post.all

end

def show
  @post = Post.find(params[:id])

end

def new
  @post = Post.find(params[:id])
end

  def create
    @post = Post.new(post_params)
    @post.user = @current_user
      if @post.save
        flash[:succes] = "Great new post"
        redirect_to root_path
      else
        flash[:notice] = "Message failed to save"
        render "new"

      end
    end



def update
  if @post.update(post_params)
    redirect_to root_url
  else
    render "edit"
  end
end

private

def set_post
      @post = Post.find(params[:id])

    end

def post_params
  params.require(:post).permit(:user_name, :url, :message)
end
  def check_if_currrent_user_is_owner
    @post = Post.find(params[:id])
    unless @post.user == @current_user
      redirect_to root_url
    end
  end
end
