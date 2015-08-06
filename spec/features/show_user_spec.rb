require_relative '../spec_helper'

RSpec.describe 'user profile page' do
  it 'displays information about user' do
    u = create_user("Kobe Bryant")
    visit "/users/#{u.id}"
    expect(page).to have_text("#{u.first_name}")
    expect(page).to have_text("#{u.last_name}")
  end
end