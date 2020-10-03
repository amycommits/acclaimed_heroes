class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_badges
  has_many :badges, through: :user_badges
  
  def badge_remote_ids
    badges.map{|x| x.remote_id}
  end
end
