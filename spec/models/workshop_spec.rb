require 'rails_helper'

  describe Workshop do

    it {should belong_to(:location)}
    it {should belong_to(:slot)}
    it {should belong_to(:user)}

    it { should validate_presence_of :title }

end
