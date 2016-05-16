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
    @bookings = Booking.where("user_id = #{current_user.id}")
  end

  def pools
    @pools = Pool.where("user_id = #{current_user.id}")
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :birth_date, :address, :bio, :phone)
  end

end
