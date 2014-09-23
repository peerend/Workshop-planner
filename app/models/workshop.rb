class Workshop < ActiveRecord::Base

  belongs_to :slot
  belongs_to :user
  belongs_to :location

  validates :title, :presence => true
  validates :presenter, :presence => true

  def worktitles
    location.workshop.each do |workshop|
      workshoptitles << workshop.title
      workshoptitles.flatten
    end
  end
end