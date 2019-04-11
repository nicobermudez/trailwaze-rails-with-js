class Itinerary < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :reviewed_itineraries, through: :users, source: :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :budget, presence: true

  def self.search(search)
    if search
      itinerary = Itinerary.where(['lower(title) LIKE ?', "%#{search.downcase}%"]) || Itinerary.where(['lower(description) LIKE ?', "%#{search.downcase}%"])
      if itinerary
        self.where(id: itinerary)
      else
        Itinerary.all
      end
    end
  end
end
