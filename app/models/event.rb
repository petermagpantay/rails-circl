class Event < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :event_categories, dependent: :destroy
  has_many :categories, through: :event_categories
  has_one_attached :image

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :event_date, presence: true
  # validates :location, presence: true
end
