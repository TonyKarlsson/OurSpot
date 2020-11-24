class MessagesController < ApplicationController

  def index
  end

  def show
    @message = Message.find(params[:id])
    @chatroom = Chatroom.new
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
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
    params.require(:message).permit(:content, :photo)
  end
end
