require "open-uri"
class UserInMessageRadius
  def initialize(user, request, message)
    @user = user
    @request = request
    @message = message
  end

  def perform
    if distance_between < 5 && @user != @message.user
      @message.read = true
      @message.save!
    end
  end

  private

  def distance_between
    user_location = JSON.parse(open("http://iplocate.io/api/lookup/#{@request}").read)
    coordinates = [user_location['latitude'], user_location['longitude']]
    Geocoder::Calculations.distance_between(coordinates, "#{@message.latitude}, #{@message.longitude}")

    # Geocoder::Calculations.distance_between("henriksdalsringen 27, Nacka, Stockholm", "#{@message.latitude}, #{@message.longitude}")
    # "59.3294, 18.0687"
  end
end
