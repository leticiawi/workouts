class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    stream_for "chatroom_#{params[:chatroom_id]}"
  end
end
