class Event < ApplicationRecord
  belongs_to :user
  has_many :requests
  has_many :comments

  validates :title, presence: true, length: { minimum: 10 }
  validates :description, presence: true, length: { minimum: 30 }
  validates :event_date, presence: true
  validates :event_time, presence: true
  # validates :location, presence: true
end
