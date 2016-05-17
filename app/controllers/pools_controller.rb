class PoolsController < ApplicationController
  before_action :find_pool, only: [:show, :edit, :update]

  def index
    @location = params[:location].downcase
    @pools = search_pools_by_location
    if params.has_key?(:reservation_date)
      reservation_string = params[:reservation_date].gsub!('%2F','/')
      @reservartion_date = date_string_to_date(reservation_string)
      @pools = fetch_pools_by_availability
    end
  end

  def show
    @booking = Booking.new
    find_pool
  end

  def edit
    find_pool
  end

  def update
    find_pool
    @restaurant.update(params[:restaurant])
  end

  def new
    @pool = Pool.new
    @pool.user = current_user
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  private

  def find_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:user_id, :width, :length, :depth, :shape, :location, :water_type, :latitude, :longitude, :equipments, :price, :description, :status)
  end

  def search_pools_by_location
    return Pool.where("location = ?", @location.capitalize)
  end

  def fetch_pools_by_availability
    results = []
    @pools.each do |pool|
      pool.agendas.each do |agenda|
        results << pool if ( @reservation_date >= date_string_to_date(agenda.start_date) &&  @reservation_date <= date_string_to_date(agenda.end_date))
      end
    end
    return results
  end

  def date_string_to_date(date_string)
    date_array = date_string.split('/')
    return Date.new(date_array[2], date_array[1], date_array[0])
  end

end
