require 'rails_helper'
<<<<<<< HEAD
include RestaurantsHelper

feature 'restaurants' do
	context 'no restaurants have been added' do
		scenario 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before do
			Restaurant.create(name: 'KFC')
		end
		scenario 'display restaurants' do
		visit '/restaurants'
		expect(page).to have_content('KFC')
		expect(page).not_to have_content('No restaurant yet')
		end
	end

	context 'creating restaurants' do
		scenario 'prompts user to fill out a form, then displays the new restaurant' do
		visit '/restaurants'
		sign_up
		click_link 'Add a restaurant'
		fill_in 'Name', with: 'KFC'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
		end

		context 'an invalid restaurant' do
			it 'does not let you submit an incompleted form' do
				visit '/restaurants'
				sign_up
				click_link 'Add a restaurant'
		    fill_in 'Name', with: 'KF'
		    click_button 'Create Restaurant'
		    expect(page).not_to have_content 'KF'
		    expect(page).to have_content 'error'
			end
		end
	end

	context 'viewing restaurants' do
		let!(:kfc){Restaurant.create(name:'KFC')}
		scenario 'lets a user view a restaurant' do
			visit '/restaurants'
			click_link 'KFC'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq "/restaurants/#{kfc.id}"
		end
	end

	context 'updating restaurants' do
		scenario 'user can edit existing restaurant' do
			visit '/restaurants'
			sign_up
			click_link 'Add a restaurant'
		  fill_in 'Name', with: 'KFC'
		  click_button 'Create Restaurant'
			click_link 'Edit KFC'
			fill_in 'Name', with: 'Maccas'
			click_button 'Update Restaurant'
			expect(page).to have_content 'Maccas'
		end
	end

	context 'deleting restaurants' do
		# before {Restaurant.create name: 'KFC'}
		scenario 'user can delete a restaurant' do
			visit '/restaurants'
			sign_up
			click_link 'Add a restaurant'
		  fill_in 'Name', with: 'KFC'
		  click_button 'Create Restaurant'
			click_link 'Delete KFC'
			expect(page).not_to have_content 'KFC'
			expect(page).to have_content "Restaurant deleted"
		end
	end

	feature 'User can only edit restaurants which they have created' do

	  it "cannot edit another users restaurant" do
	 	 sign_up
	 	 click_link 'Add a restaurant'
		 fill_in 'Name', with: 'KFC'
		 click_button 'Create Restaurant'
	 	 click_link('Sign out')
	 	 sign_up_second_user
	   expect(page).not_to have_link('Edit KFC')
	  end
  end


=======

feature 'restaurants' do
  context 'no restaurants have been added' do
    scenario 'should display a prompt to add a restaurant' do
      visit '/restaurants'
      expect(page).to have_content 'No restaurants yet'
      expect(page).to have_link 'Add a restaurant'
    end
  end

  context 'restaurants have been added' do
    before do
      Restaurant.create(name: 'KFC')
    end
    scenario 'display restaurants' do
      visit '/restaurants'
      expect(page).to have_content 'KFC'
      expect(page).not_to have_content 'No restaurants yet'
    end
  end

  context 'creating restaurants' do
    scenario 'prompts user to fill out a form, then displays the new restaurant' do
      visit '/restaurants'
      sign_up
      create_restaurant_1
      expect(page).to have_content 'KFC'
      expect(current_path).to eq '/restaurants'
    end

    context 'an invalid restaurant' do
      scenario 'does not let you submit a name that is too short' do
        visit '/restaurants'
        sign_up
        click_link 'Add a restaurant'
        fill_in 'Name', with: 'kf'
        click_button 'Create Restaurant'
        expect(page).not_to have_css 'h2', text: 'kf'
        expect(page).to have_content 'error'
      end
    end

    context 'unless logged in' do
      scenario 'should not be able to create a new restaurant' do
        visit '/restaurants'
        click_link 'Add a restaurant'
        expect(page).to have_content 'Log in'
      end
    end
  end

  context 'viewing restaurants' do
    let!(:kfc) {Restaurant.create(name: 'KFC')}

    scenario 'lets a user view a restaurant' do
      visit '/restaurants'
      click_link 'KFC'
      expect(page).to have_content 'KFC'
      expect(current_path).to eq "/restaurants/#{kfc.id}"
    end
  end

  context 'editing restaurants' do
    before do
      visit '/restaurants'
      sign_up
      create_restaurant_1
    end

    scenario 'let a user edit a restaurant' do
      click_link 'Edit KFC'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      click_button 'Update Restaurant'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(current_path).to eq '/restaurants'
    end

    scenario 'disallows non-owners from editing a restaurant' do
      click_link 'Sign out'
      sign_up_second_user
      expect(page).not_to have_link 'Edit KFC'
    end
  end

  context 'deleting restaurants' do
    before do
      visit '/restaurants'
      sign_up
      create_restaurant_1
    end

    scenario 'removes a restaurant when a user clicks a delete link' do
      click_link 'Delete KFC'
      expect(page).not_to have_content 'KFC'
      expect(page).to have_content 'Restaurant deleted successfully'
    end
  end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
end