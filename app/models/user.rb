class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews
  has_many :coffee_shops

  has_many :user_votes
  has_many :reviews, through: :user_votes

  # mount_uploader :profile_photo, ProfilePhotoUploader
  
  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: ["admin", "member"] }
end
