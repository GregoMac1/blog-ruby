class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def get_post
    @post = Post.find(params[:id])
  end

  def index
    if current_user.editor?
      @posts = Post.all
    else
      @posts = Post.where(is_hidden: false)
    end
    @posts = @posts.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.created_by = current_user.id
    @post.last_updated_by = current_user.id
    if @post.save
      redirect_to @post
    else
      render :post, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post.last_updated_by = current_user.id
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

  def hide
    @post = Post.find(params[:id])
    @post.is_hidden = true
    @post.save
    redirect_to @post
  end

  def unhide
    @post = Post.find(params[:id])
    @post.is_hidden = false
    @post.save
    redirect_to @post
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :image)
    end
end
