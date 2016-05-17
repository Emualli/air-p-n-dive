class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end
end
