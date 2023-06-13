class CommentsChannel < ApplicationCable::Channel
  def subscribed
    post = Post.find(params['post_id'])
    stream_from post
  end

  def unsubscribed
  end

  def send_comment(data)
    current_user.comments.create!(content: data['comment'], post_id: data['post_id'])
  end
end
