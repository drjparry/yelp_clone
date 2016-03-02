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
end