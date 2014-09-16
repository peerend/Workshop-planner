require 'rails_helper'

describe "the signin process" do
  it "signs a user in who uses the right password" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in'
    expect(page).to have_content 'Logged in!'
  end

  it "gives an error for an incorrect password" do
    visit 'login'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '1234567'
    click_button 'Log in'
    expect(page).to have_content 'Email or password is invalid'
  end
end
