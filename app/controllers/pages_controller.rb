class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @home = true
    # redirect_to chatrooms_path if current_user
  end
end
