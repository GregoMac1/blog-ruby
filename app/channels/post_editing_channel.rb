class PostEditingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "post_#{params[:post_id]}"
  end

  def unsubscribed
    ActionCable.server.broadcast "post_#{params[:post_id]}", {
      action: "editing",
      enabled: false,
    }
  end
end
