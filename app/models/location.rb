class Location < ActiveRecord::Base

  has_many :workshops

  validates :address, :presence => true
  
end