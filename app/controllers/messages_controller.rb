class MessagesController < ApplicationController
  def index
  end

  def show
    @message = Message.find(params[:id])
    authorize @message
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    # friend2 = params[:friend2].nil? ? params[:chatroom][:friend2] : params[:friend2]
    @friend2 = User.find(params[:friend2])
    @message = Message.new(message_params)
    @message.user = current_user
    @chatroom = Chatroom.find(params[:id]) if params[:id]
    authorize @message
      if @chatroom || @chatroom = Chatroom.where(friend1: current_user, friend2: @friend2).first || Chatroom.where(friend2: current_user, friend1: @friend2).first
        @message.chatroom = @chatroom
      else
        @chatroom = Chatroom.new
        @chatroom.friend1 = current_user
        @chatroom.friend2 = User.find(params[:friend2])
        @chatroom.save!
        @message.chatroom = @chatroom
      end
    if @message.save!
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end

  def destroy
    @message = Message.find(params[:id])
    authorize @message
    @message.destroy
    redirect_to messages_path
  end


  private

  def message_params
    params.require(:message).permit(:content, :longitude, :latitude, photos: [])
  end
end
