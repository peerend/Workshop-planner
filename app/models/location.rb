class Location < ActiveRecord::Base

  has_many :workshops

  geocoded_by :address

  validates :address, :presence => true
  validates :name, :presence => true

  after_validation :geocode
  
end