require 'rails_helper'
include RestaurantsHelper

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit '/restaurants'
      sign_up
    end

    scenario "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

    scenario 'can only add one review per restaurant' do
      click_link 'Add a restaurant'
      fill_in 'Name', with: 'KFC'
      click_button 'Create Restaurant'
      click_link 'Sign out'
      sign_up_second_user
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'okay'
      select '3', from: 'Rating'
      click_button 'Leave Review'
      expect(page).not_to have_link 'Review KFC'
    end

    scenario 'can delete own reviews' do
      create_restaurant_1
      click_link 'Sign out'
      sign_up_second_user
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'okay'
      select '3', from: 'Rating'
      click_button 'Leave Review'
      click_link 'Delete Review'
      expect(page).not_to have_content('okay')
      expect(page).to have_link 'Review KFC'
    end
  end
end