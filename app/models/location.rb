class Location < ActiveRecord::Base

  has_many :workshops

  validates :address, :presence => true
  validates :name, :presence => true
  
end