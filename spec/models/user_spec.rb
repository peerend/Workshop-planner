require 'rails_helper'

describe User do

  it {should have_many(:workshops)}
  
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end
