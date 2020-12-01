
class UserInMessageRadius
  def initialize(user, request, message)
    @user = user
    @request = request
    @message = message
  end

  def perform
    puts distance_between
    distance_between < 5
  end

  private

  def distance_between
    Geocoder::Calculations.distance_between(@user.current_sign_in_ip, "#{@message.latitude}, #{@message.longitude}")
    # Geocoder::Calculations.distance_between("henriksdalsringen 27, Nacka, Stockholm", "#{@message.latitude}, #{@message.longitude}")
    # "59.3294, 18.0687"
  end
end
