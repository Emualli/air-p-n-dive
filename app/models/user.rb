class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :pools
  has_attachment :avatar

  # validates :first_name, :last_name, :birth_date, :address, :phone, :email, presence: true
  #
  #

  # def count_pending_actions
  #   # je veux aller chercher les created dans le cas ou qqun a fait une résa sur ma pool
  #   # je veux aller chercher les accepted dans le cas ou j'ai fait une résa

  #   @bookings = Booking.all

  #   @count = @bookings.pool.where('user_id = #{current_user?id} AND status = "created"').size unless @bookings.pool.nil?
  #   @count += @bookings.where('user_id = #{current_user?id} AND status = "accepted"').size unless @bookings.nil?
  # end
end
