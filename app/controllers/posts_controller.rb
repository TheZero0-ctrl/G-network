class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :destroy
  def index
    @posts = Post.all
    @post = current_user.posts.build
  end

  def create
    @posts = Post.all
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      flash[:success] = "Post created"
      redirect_to root_url
    else
      flash[:error] = "something wrong"
      render "posts/index"
    end
  end

  def destroy
      @post.destroy
      flash[:success] = "Micropost deleted"
      redirect_to request.referrer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:body, :image)
  end

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_url if @post.nil?
  end
end
