class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :searchjson]
  def home
    @booking = Booking.new
  end
end
