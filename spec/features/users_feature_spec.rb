require 'rails_helper'


feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
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



end