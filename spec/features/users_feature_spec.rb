require 'rails_helper'
<<<<<<< HEAD


feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
=======
include RestaurantsHelper

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    scenario "should see a 'sign in' link and a 'sign up' link" do
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

<<<<<<< HEAD
    it "should not see 'sign out' link" do
=======
    scenario "should not see 'sign out' link" do
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
<<<<<<< HEAD
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
=======
      visit '/restaurants'
      sign_up
    end

    scenario "should see 'sign out' link" do
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
      visit('/')
      expect(page).to have_link('Sign out')
    end

<<<<<<< HEAD
    it "should not see a 'sign in' link and a 'sign up' link" do
=======
    scenario "should not see a 'sign in' link and a 'sign up' link" do
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
<<<<<<< HEAD
  end

  context 'unless logged in ' do
    it 'shoulde not be able to create a new restaurant' do
      visit '/'
      click_link 'Add a restaurant'
      expect(page).to have_content 'Log in'
    end
  end


feature "Users can only add one review per restaurant" do
  context "whilst logged in" do
    it "cannot add more than one review for a single restaurant" do

     sign_up
     click_link 'Add a restaurant'
     fill_in 'Name', with: 'KFC'
     click_button 'Create Restaurant'
     click_link('Sign out')
     sign_up_second_user
      click_link 'Review KFC'
      fill_in 'Thoughts', with: 'so so'
      select '3', from: 'Rating'
      click_button 'Leave review'
      expect(page).not_to have_link('Review KFC')
    end
  end
end



=======

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
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
end