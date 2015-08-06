require_relative '../spec_helper'

RSpec.describe 'user edit page' do
  it 'displays information about user being edited' do
    user = create_user('Kobe Bryant')
    visit "/users/#{user.id}/edit"

    expect(find_field('First Name').value).to eq(user.first_name)
    expect(find_field('Last Name').value).to eq(user.last_name)
    expect(find_field('Email').value).to eq(user.email)
  end
end