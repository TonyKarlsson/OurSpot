require "open-uri"
class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  before_action :ip_print
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
  def configure_permitted_parameters
      # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :photo)}
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def ip_print
    if Rails.env.production?
      @ip = current_user.current_sign_in_ip if current_user
      puts "Ip Address: #{@ip}"
    else
      @ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
      puts "Ip Address: #{@ip}"
    end
  end
end
