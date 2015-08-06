require_relative '../spec_helper'
RSpec.describe 'listing users' do
  it 'displays list of existing users' do
    ["Kobe Bryant", "Julius Randle"].each do |name|
      create_user(name)
    end
    visit '/users'
    expect(page.status_code).to eq(200)
    expect(page).to have_text("Kobe Bryant")
    expect(page).to have_text("Julius Randle")
  end
end