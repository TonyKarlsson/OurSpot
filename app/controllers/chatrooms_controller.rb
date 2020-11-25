class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
