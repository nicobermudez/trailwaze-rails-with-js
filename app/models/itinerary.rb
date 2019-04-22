class Itinerary < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy

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

  def already_liked?(user)
    Review.where(user_id: user.id, itinerary_id: self.id).exists?
  end

end
