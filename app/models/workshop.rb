class Workshop < ActiveRecord::Base

  belongs_to :slot
  belongs_to :user
  belongs_to :location

  validates :title, :presence => true
  
end