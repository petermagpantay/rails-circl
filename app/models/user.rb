class User < ApplicationRecord
  has_many :comments
  has_many :events
  has_many :requests
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :age, presence: true
  validates :age, inclusion: 18..99
  # validates :user_name, presence: true
  validates :user_name, uniqueness: true
  validates :email, uniqueness: true
end
