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

  def count_pending_actions
    # count actions pour navbar
    # les created dans le cas ou qqun a fait une résa sur ma pool
    # les accepted dans le cas ou j'ai fait une résa

    count = 0
    count += Booking.all.where('user_id = ? AND status = "accepted"', self.id).size unless @bookings.nil?

    Booking.all.each do |booking|
      count += 1 if booking.pool.user_id == self.id && booking.status == "created"
    end

  return count
  end
end
