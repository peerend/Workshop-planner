class User < ActiveRecord::Base

  has_many :workshops
  has_secure_password

  validates :name, :presence => true
  validates :email, :presence => true
  validates_uniqueness_of :email
  
end