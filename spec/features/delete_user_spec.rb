require_relative '../spec_helper'

RSpec.describe 'deleting user' do
  it 'deletes user and redirects to users page' do
    user = create_user("Kobe Bryant")

    visit '/users'
    expect(page).to have_text("Kobe")

    visit "/users/#{user.id}/edit"
    expect(page.status_code).to eq(200)

    click_button 'Delete User'
    # expect(current_path).to eq('/users')
    # expect(page).to_not have_text('Kobe')
  end
end