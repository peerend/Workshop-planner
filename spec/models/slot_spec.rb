require 'rails_helper'

  describe Slot do

    it {should have_many(:workshops)}
    it { should validate_presence_of :time }

end
