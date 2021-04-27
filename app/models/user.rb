class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :coffee_shops

  # mount_uploader :profile_photo, ProfilePhotoUploader
  
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ["admin", "member"] }
end
