class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show, :searchjson]
  before_action :find_pool, only: [:show, :edit, :update]

  def index
    if !params.has_key?(:location) || params[:location].empty?
      @pools = Pool.all
    else
      @location = params[:location].downcase
      @pools = search_pools_by_location
    end
    if params.has_key?(:reservation_date) && !params[:reservation_date].empty?
      reservation_string = params[:reservation_date].gsub('%2F','/')
      @reservation_date = date_string_to_date(reservation_string)
      @pools = fetch_pools_by_availability
    end
    # Let's DYNAMICALLY build the markers for the view.
    @markers = Gmaps4rails.build_markers(@pools) do |pool, marker|
      @pool = pool
      marker.lat pool.latitude
      marker.lng pool.longitude
      marker.infowindow render_to_string(partial: "pool_infowindow", :locals => { :object => pool}).gsub(/\n/, '')
      marker.picture url: ActionController::Base.helpers.asset_path("goutte-deau-icon.png"), width: 38, height: 50#, shadow_width: "20", shadow_height: "50", shadow_anchor: [5, 10]
    end
  end

  def availaibility
  #<--TODO-->
  end

  def show
    @booking = Booking.new
    find_pool
    get_available_booking_dates
  end

  def edit
  end

  def update
    if @pool.update(pool_params)
      redirect_to pool_path(@pool)
    else
      render :edit
    end
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
      @show_modale = true
      @pools = Pool.where("user_id = #{current_user.id}")
      render "users/pools"
    end
  end

  def searchjson
    if !params.has_key?(:location) || params[:location].empty?
      @pools = Pool.all
    else
      @location = params[:location].downcase
      @pools = Pool.where("location <> ?", @location.capitalize)
    end
    if params.has_key?(:max_price) && !params[:max_price].empty?
      max_price = params[:max_price].to_i
      @pools = @pools.where("price > ?", max_price)
    end
    @ids = @pools.select("id")
    render :searchjson, :layout => false
  end

  private

  def get_available_booking_dates
    init_agenda = Agenda.where('pool_id = ?', @pool.id) || []
    @agendas = init_agenda.map { |a| [a.start_date, a.end_date] }.map do |couple|
      date_range = (Date.parse(couple[0])..Date.parse(couple[1])).map(&:to_s)
    end
    @agendas = @agendas.flatten.map { |d| d.split('-').reverse.join('/') }
    @all = (Date.parse('01/01/2016')..Date.parse('31/12/2016')).map(&:to_s).flatten.map { |d| d.split('-').reverse.join('/') }
    @final = @all - @agendas
  end

  def find_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:user_id, :width, :length, :depth, :shape, :location, :water_type, :address, :latitude, :longitude, :equipments, :price, :description, :status, :title, photos: [])
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
    return Date.new(date_array[2].to_i, date_array[1].to_i, date_array[0].to_i)
  end

end
