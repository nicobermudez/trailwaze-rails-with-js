class User < ApplicationRecord

  # bcrypt helper 
  has_secure_password

  # model relationships
  has_many :itineraries
  has_many :destinations, through: :itineraries
  has_many :accomodations, through: :itineraries
  has_many :experiences, through: :itineraries
  has_many :transportations, through: :itineraries

  # validations
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :username, uniqueness: true
  validates :email, uniqueness: true
  validates :password, :length: {minimum: 6}

end
