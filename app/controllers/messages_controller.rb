class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end
end

# tutorial
# def create
#   @message = Message.new(message_params)
#   @chatroom = Chatroom.find(params[:chat_room_id])
#   @message.chatroom = @chatroom
#   @message.user = current_user
#   if @message.save
#     respond_to do |format|
#       format.html { redirect_to chatroom_path(@chatroom) }
#       format.js
#     end
#   else
#     respond_to do |format|
#       format.html { render "chatroom/show" }
#       format.js
#     end
#   end
# end

# private

# def message_params
#   params.require(:message).permit(:content)
# end
