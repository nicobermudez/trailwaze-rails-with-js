class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  # has_many :destinations
  # has_many :experiences, through: :destinations
  # has_many :accommodations, through: :destinations
  # has_many :transportations

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true
end
