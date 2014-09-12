class Slot < ActiveRecord::Base

  has_many :workshops

  validates :time, :presence => true

end