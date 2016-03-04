module RestaurantsHelper
  def sign_up
<<<<<<< HEAD
    visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
  end

  def sign_up_second_user
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test2@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
=======
    click_link 'Sign up'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def sign_up_second_user
    click_link 'Sign up'
    fill_in 'Email', with: 'test@tester.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
  end

  def create_restaurant_1
    click_link 'Add a restaurant'
    fill_in 'Name', with: 'KFC'
    click_button 'Create Restaurant'
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
  end
end
