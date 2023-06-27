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
    if @comment.save
      ActionCable.server.broadcast "post_#{@post.id}", {
        action: 'new_comment',
        comment: @comment,
        html: render(
          partial: 'comments/comment',
          locals: { comment: @comment }
        ),
        current_user: current_user.id
      }
    else
      if @comment.body.empty?
        flash[:danger] = "El comentario no puede estar vacío."
      else
        flash[:danger] = "Se ha producido un error."
      end
      redirect_to @post
    end
  end

  def typing
    ActionCable.server.broadcast "post_#{params[:post_id]}", {
      action: 'typing',
      enabled: params[:typing],
      user_id: current_user.id,
      user_name: current_user.name
    }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
