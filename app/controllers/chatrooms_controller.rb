class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def show
    authorize @chatroom
    @chatroom = Chatroom.find(params[:id])
  end

end
