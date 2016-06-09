require 'rails_helper'

RSpec.feature "Authentications", type: :feature do
  it 'displays login links' do
    visit root_path
    expect(page).to have_content 'Sign up'
    expect(page).to have_content 'Login'
  end

  it 'authenticate a user with a valite account' do
    user = create(:user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
