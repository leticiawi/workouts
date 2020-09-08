class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    # acima, sigo a aula. Abaixo sigo o tutorial do kitt.
    # @chatroom = Chatroom.includes(messages: :user).find(params[:id])
  end
end
