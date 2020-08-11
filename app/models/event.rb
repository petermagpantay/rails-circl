class Event < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :comments
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :event_date, presence: true
  # validates :location, presence: true
end
