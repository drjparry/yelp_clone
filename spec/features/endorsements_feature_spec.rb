require 'rails_helper'


feature 'endorsing reviews' do
  before do
    kfc = Restaurant.create(name: 'KFC')
    kfc.reviews.create(rating: 3, thoughts: "It was an abomination")
  end

  scenario 'a user can endores a review, which updates the review endorsment count', js: true do
    visit '/restaurants'
    click_link 'Endorse Review'
    expect(page).to have_content('1 endorsement')
  end
end