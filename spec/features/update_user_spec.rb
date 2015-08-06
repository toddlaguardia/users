require_relative '../spec_helper'

RSpec.describe 'updating user' do
  it 'updates user and redirect to users page' do
    user = create_user('Kobe Bryant')
    visit "/users/#{user.id}/edit"
    expect(page.status_code).to eq(200)
    fill_in 'First Name', with: 'Vino'
    click_button 'Update User'
    expect(current_path).to eq('/users')
    expect(page).to have_text('Vino')
    expect(page).not_to have_text('Kobe')
  end
end