
class UserInMessageRadius
  def initialize(user, request, message)
    @user = user
    @request = request
    @message = message
  end

  def perform
    distance_between < 5
  end

  private

  def distance_between
    # Geocoder::Calculations.distance_between(@request, "#{@message.latitude}, #{@message.longitude}")
    # Geocoder::Calculations.distance_between("copenhagen", "#{@message.latitude}, #{@message.longitude}")
    # "59.3294, 18.0687"
  end
end
