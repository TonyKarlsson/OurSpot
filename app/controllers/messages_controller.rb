require 'open-uri'

class MessagesController < ApplicationController
  def index
  end

  def show
    @message = Message.find(params[:id])
    authorize @message
    map_marker
  end

  def new
    @message = Message.new
    authorize @message
    get_user_coordinates_from_ip
    map_marker
  end

  def create
    @friend2 = User.find(params[:friend2])
    @message = Message.new(message_params)
    @message.user = current_user
    get_user_coordinates_from_ip
    @chatroom = Chatroom.find(params[:id]) if params[:id]
    @address = Geocoder.search([@message.latitude, @message.longitude])
    authorize @message
    if @chatroom || @chatroom = Chatroom.where(friend1: current_user, friend2: @friend2).first || @chatroom = Chatroom.where(friend2: current_user, friend1: @friend2).first
      @message.chatroom = @chatroom
    else
      @chatroom = Chatroom.new
      @chatroom.friend1 = current_user
      @chatroom.friend2 = User.find(params[:friend2])
      @chatroom.save!
      @message.chatroom = @chatroom
    end
    if @message.save!
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
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

  def get_user_coordinates_from_ip
    user_location = JSON.parse(URI.open("http://iplocate.io/api/lookup/#{@ip}").read)
    @message.latitude = user_location['latitude']
    @message.longitude = user_location['longitude']
  end

  def map_marker
    @markers = [{
      lat: @message.latitude,
      lng: @message.longitude
      }]
  end

  def message_params
    params.require(:message).permit(:content, :photo)
  end
end
