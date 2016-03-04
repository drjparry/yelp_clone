require 'rails_helper'
<<<<<<< HEAD

feature 'reviewing restaurants' do
  before{Restaurant.create name: 'KFC'}
  scenario 'Users can leave a review using a form' do
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'so so '
  end
end
=======
include RestaurantsHelper

feature 'reviewing' do
  before do
      visit '/restaurants'
      sign_up
      create_restaurant_1
    end

  scenario 'allows users to leave a review using a form' do
    click_link 'Sign out'
    sign_up_second_user
    click_link 'Review KFC'
    fill_in 'Thoughts', with: 'so so'
    select '3', from: 'Rating'
    click_button 'Leave Review'
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content 'so so'
  end
end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
