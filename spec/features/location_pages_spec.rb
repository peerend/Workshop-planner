require 'rails_helper'

describe "Adding a location" do
  it "enables the user to add a location" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in' 
    visit '/locations/new'
    fill_in 'Name', :with => 'example location'
    fill_in 'Address', :with => 'Example location Address'
    click_button 'Create Location'
    expect(page).to have_content 'Location Added'
  end

  it "does not let the user to add a location without an address" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in' 
    visit '/locations/new'
    fill_in 'Name', :with => 'example location'
    click_button 'Create Location'
    expect(page).to have_content "Address can't be blank"
  end
end
