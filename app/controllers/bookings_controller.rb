class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # --TODO-- Change to @booking = Booking.find() with a .update afterwards
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.pool = @pool
    # --TODO-- define status update
    if @booking.save
      redirect_to booking_path(@booking)
    else
      # render : --TODO--
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date, :price, :pool_id)
  end

end
