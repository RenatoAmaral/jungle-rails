require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do

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

  scenario "See a product detail",  js: true do
    #act
    visit root_path
    first('.product').click_link('Details')

    #Debug / Verify
    expect(page).to have_css('.products-show')
    save_and_open_screenshot
  end
end
