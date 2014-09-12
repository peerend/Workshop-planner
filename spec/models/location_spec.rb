require 'rails_helper'

  describe Location do

    it {should have_many(:workshops)}
    it { should validate_presence_of :address }

end
