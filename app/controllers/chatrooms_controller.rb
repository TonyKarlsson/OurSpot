class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom.where(friend1: current_user).or(Chatroom.where(friend2: current_user))).order(created_at: :desc)
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
end
