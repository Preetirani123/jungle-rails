require 'rails_helper'


RSpec.feature "Product details page", type: :feature, js: true do

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

  scenario "They see product page" do
    # ACT
    visit root_path

    first('article.product').click_on 'Details'
    # DEBUG / VERIFY
    expect(page).to have_content '10'
    save_screenshot
  end

  scenario "They see product page detail" do
    # ACT
    visit root_path

    first('article.product').click_on 'Details'
    # DEBUG / VERIFY
    expect(page).to have_content '64.99'
    save_screenshot
  end
end