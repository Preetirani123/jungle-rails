require 'rails_helper'


RSpec.feature "Visit add to cart page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see cart number update" do
    # ACT
    visit root_path
    first('article.product').find_button('Add').click

    # save_screenshot
    # DEBUG
    expect(page).to have_content 'My Cart (1)'
    

    
  end
end