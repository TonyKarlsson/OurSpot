class ChatroomsController < ApplicationController

  def index
    authorize @chatroom
    @chatrooms = Chatroom.all
  end

  def show
    authorize @chatroom
    @chatroom = Chatroom.find(params[:id])
  end

end
