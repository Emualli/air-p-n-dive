class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :cancel, :pay, :accept, :reject]

  def new
    @booking = Booking.new
  end

  def index
    @bookings = Booking.all
  end

  def create
    # Create Booking Instance with proper parameters
    @booking = Booking.new(booking_params)
    @pool = Pool.find(params[:booking][:pool_id])

    @booking.status = "created"
    @booking.user = current_user
    @booking.price = @pool.price
    @booking.pool = @pool


    if @booking.isValidForSaving? && @booking.save
      redirect_to user_bookings_path(current_user.id)
    else
      render 'pools/show'
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
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.status = "cancelled"
    @booking.save

    redirect_to booking_path(@booking)
  end

  def pay
    @booking.status = "paid"
    @booking.save

    redirect_to booking_path(@booking)
  end

  def accept
    @booking.status = "accepted"
    @booking.save

    redirect_to booking_path(@booking)
  end

  def reject
    @booking.status = "rejected"
    @booking.save

    redirect_to booking_path(@booking)
  end

  private

  def set_booking
    unless params[:id].nil?
      @booking = Booking.find(params[:id])
    else
      @booking = Booking.find(params[:booking_id])
    end
  end

  def booking_params
    params.require(:booking).permit(:pool_id, :date, :start_time, :end_time)
  end
end
