class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :get_post, only: [:show, :edit, :update, :destroy]

  def get_post
    @post = Post.find(params[:id])
  end

  def index
    if current_user && current_user.editor?
      @posts = Post.all
    else
      @posts = Post.where(is_hidden: false)
    end
    @posts = @posts.order(created_at: :desc)
  end

  def show
    @comments = @post.comments.order(created_at: :desc)
    @comment = Comment.new
    @comment.post_id = @post.id
  end

  def new
    @post = Post.new
  end

  def create
    begin
      post_params[:image].open #fixes bug on Windows
    rescue
    end
    if (post_params[:image] == nil) || (post_params[:image] == "")
      flash.now[:danger] = "Por favor, seleccione una imagen válida."
      render :new, status: :unprocessable_entity
      return
    end
    @post = Post.new(post_params)
    @post.created_by = current_user.id
    @post.last_updated_by = current_user.id
    if @post.save
      ActionCable.server.broadcast "posts", {
        action: 'new_post',
        post: @post,
        html: render(
          partial: 'posts/post',
          locals: { post: @post }
        ),
      }
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    begin
      post_params[:image].open #fixes bug on Windows
    rescue
    end
    if (post_params[:image] == nil) || (post_params[:image] == "")
      flash.now[:danger] = "Por favor, seleccione una imagen válida."
      render :edit, status: :unprocessable_entity
      return
    end
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
