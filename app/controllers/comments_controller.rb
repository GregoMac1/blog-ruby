class CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :get_post, only: [:create]

  def get_post
    @post = Post.find(params[:post_id])
  end

  def index
    redirect_to @post
  end

  def show
    redirect_to @post
  end

  def new
    @comment = Comment.new
  end

  def create
    params[:comment][:post_id] = @post.id
    params[:comment][:user_id] = current_user.id
    @comment = @post.comments.create(comment_params)
    # ActionCable.server.broadcast "post_#{@post}", render(partial: 'comments/comment',
      # locals: { comment: @comment, current_user: current_user })
    ActionCable.server.broadcast "post_#{@post.id}", {message: "hello"}
    if @comment.save
      #redirect_to @post
    else
      flash[:danger] = "El comentario no puede estar vacío."
      redirect_to @post
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
