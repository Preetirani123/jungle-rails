require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do

    @user = User.create! email: 'preeti@test.com', first_name: 'preeti', last_name: 'Rani', password: 'preeti@123', password_confirmation: 'preeti@123'

  end

  scenario "They can login" do
    # ACT
    visit '/'
    first('ul.navbar-right').find_link('Login').click
    fill_in 'email', with: 'preeti@test.com'
    fill_in 'password', with: 'preeti@123'
    click_on 'Submit'

    
     save_screenshot
    expect(page).to have_content 'Hello, preeti'
  end
end