class PoolsController < ApplicationController
  before_action :find_pool, only: [:show, :edit, :update]

  def index
    @pools = Pool.all
  end

  def show
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
    if @pool.save
      redirect_to pool_path(@pool)
    else
      render :new
    end
  end

  private

  def find_pool
    @pool = pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:user_id, :width, :length, :depth, :shape, :location, :water_type, :latitude, :longitude, :equipments, :price, :description, :status)
  end
end
