feature 'Yelp' do
  scenario 'should list restaurants' do
    Restaurant.create(name: 'Mendy\'s', rating: '4')
    Restaurant.create(name: 'Mharjiams', rating: '5')
    visit('/restaurants')
    expect(page).to have_content('Mendy\'s 4 Mharjiams 5')
  end

  scenario 'allows addition of new restaurants' do
    visit('restaurants/new')
    fill_in(:name, with: 'Carnegies')
    choose(:rating, option: '5')
    click_button('Add Restaurant')
    expect(page).to have_content('Carnegies 5')
  end

  scenario 'allows users to edit restaurant' do
    Restaurant.create(name: 'Mendy\'s', rating: '4')
    visit('/restaurants')
    click_link('Edit Mendy\'s')
    fill_in(:name, with: 'Mharjiams')
    choose(:rating, option: '3')
    click_button('Submit')
    expect(page).to have_content('Mharjiams 3')
  end
end
