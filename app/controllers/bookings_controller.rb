class BookingsController < ApplicationController
  before_action :show, :edit, :update

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(params[:booking])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :price)
  end

end
