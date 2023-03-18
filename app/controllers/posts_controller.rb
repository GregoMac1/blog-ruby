class PostsController < ApplicationController
  #load_and_authorize_resource
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def get_post
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :post, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
