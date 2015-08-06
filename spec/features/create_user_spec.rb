require_relative '../spec_helper'

RSpec.describe 'creating user' do
  it 'creates a new user and redirect to users page' do
    visit '/users/new'
    fill_in 'Email', with: 'kobe@lakers.com'
    fill_in 'First Name', with: 'Kobe'
    fill_in 'Last Name', with: 'Bryant'
    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'password'
    click_button 'Create User'
    expect(current_path).to eq('/users')
    expect(page).to have_text('Kobe')
  end
end