class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(current_user)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :show
    end
  end

  def bookings
    # Get Customer bookings for the user :
    @customer_bookings = Booking.where("user_id = #{current_user.id}")

    # Get Owner reservations for the user :
    @owned_pools = Pool.where("user_id = #{current_user.id}")
    @owner_bookings = []
    @owned_pools.each do |pool|
      @owner_bookings << Booking.find_by("pool_id =  ?", pool.id) if !Booking.find_by("pool_id =  ?", pool.id).nil?
    end
  end

  def pools
    @pools = Pool.where("user_id = #{current_user.id}")
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birth_date, :address, :bio, :phone, :avatar)
  end

end
