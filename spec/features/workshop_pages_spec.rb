require 'rails_helper'

describe "Adding a workshop" do
  it "enables the user to add a workshop" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in' 
    visit '/workshops/new'
    fill_in 'Title', :with => 'example workshop'
    fill_in 'Description', :with => 'Example Workshop Description'
    fill_in 'Presenter', :with => 'Dylan'
    click_button 'Create Workshop'
    expect(page).to have_content 'Workshop Added'
  end

  it "Does not let a user enter a workshop with insufficient information" do
    visit '/sessions/new'
    user = User.create(:email => 'user@example.com', :password => '12345678', :name => 'dylan')
    fill_in 'Email', :with => 'user@example.com'
    fill_in 'Password', :with => '12345678'
    click_button 'Log in' 
    visit 'workshops/new'
    fill_in 'Description', :with => 'Example Workshop Description'
    fill_in 'Presenter', :with => 'Dylan'
    click_button 'Create Workshop'
    expect(page).to have_content "Title can't be blank"
  end
end
