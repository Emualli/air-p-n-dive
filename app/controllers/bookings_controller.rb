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
    # @booking.user = current_user
    # @booking.price = @pool.price
    # @booking.status =  "created"
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
    set_booking
    @booking.user = current_user
    @booking.pool = @pool
    if @booking.update(booking_params)
      redirect_to booking_path(@booking)
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status, :start_time, :end_time, :price, :pool_id)
  end

end
