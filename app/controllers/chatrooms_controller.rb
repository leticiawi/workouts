class ChatroomsController < ApplicationController
  def new
    @chatroom = Chatroom.new
    @chatroom = Chatroom.find(params[:id])
  end

  def index
    # @chatrooms = Chatroom.all
    @chatrooms = Chatroom.where(trainer: current_user)
  end

  def create
    @chatroom = Chatroom.new(trainer_id: params[:trainer_id], user: current_user)
      if @chatroom.save
        redirect_to chatroom_path(@chatroom)
      else
        flash[:notice] = 'Sorry, something went wrong'
        redirect_to trainnings_path
      end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
