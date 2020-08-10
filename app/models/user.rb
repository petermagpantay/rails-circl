class User < ApplicationRecord
  has_many :comments
  has_many :events
  has_many :requests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  # we need to validate age from 18-99 
  validates :user_name, presence: true
  validates :user_name, uniqueness: true
end
