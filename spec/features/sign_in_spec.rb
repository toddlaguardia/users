require_relative '../spec_helper'
RSpec.describe 'signing in' do
  before do
    @user = create_user('Kobe Bryant')
    visit '/sessions/new'
    expect(page.status_code).to eq(200)
  end
  it "prompts for username and password" do
    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
  end
  it "signs in the user if the email/password combination is valid" do
    fill_in "Email", with: @user.email
    fill_in "Password", with: "password"
    click_button 'Sign In'
    expect(page).to have_text("#{@user.first_name}")
  end
  it "doesn't sign in user if the email/password combination is invalid" do
    fill_in "Email", with: @user.email
    fill_in "Password", with: "wrongpassword"
    click_button 'Sign In'
    expect(page).to have_text('Invalid')
  end
end