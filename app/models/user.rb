class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :pools
  has_attachment :avatar

  # validates :first_name, :last_name, :birth_date, :address, :phone, :email, presence: true
end
