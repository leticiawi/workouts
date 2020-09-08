class ChatroomChannel < ApplicationCable::Channel
  def subscribed
    chatroom = Chatroom.find(params[:id])
    stream_for chatroom
  end
end

# tutorial
  # def subscribed
  #   stream_for "chatroom_#{params[:chatroom_id]}"
  # end
