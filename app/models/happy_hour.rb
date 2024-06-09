class HappyHour < ApplicationRecord
  has_many :happy_hour_timings, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :features, through: :happy_hour_features

  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
