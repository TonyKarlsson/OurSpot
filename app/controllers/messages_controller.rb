class MessagesController < ApplicationController

  def index
  end

  def show
    @message = Message.find(params[:id])
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    authorize @message
    @friend2 = User.find(params[:friend2])
    @message = Message.new(message_params)
    @message.user = current_user
      if @chatroom = Chatroom.where(friend1: current_user, friend2: @friend2 ).first || Chatroom.where(friend2: current_user, friend1: @friend2 ).first
        @message.chatroom = @chatroom
      else
        @chatroom = Chatroom.new
        @chatroom.friend1 = current_user
        @chatroom.friend2 = User.find(params[:friend2])
        @chatroom.save!
        @message.chatroom = @chatroom
      end
    # TODO: @message.longitude =
    # TODO: @message.latitude =
    if @message.save!
      redirect_to message_path(@message)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, photos: [])
  end
end
