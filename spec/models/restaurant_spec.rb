require 'rails_helper'
require 'spec_helper'

<<<<<<< HEAD
describe Restaurant, type: :model do
  it {is_expected.to have_many :reviews }
  it {is_expected.to belong_to :user }
=======
RSpec.describe Restaurant, type: :model do
  it { is_expected.to have_many :reviews }
  it { is_expected.to belong_to :user }
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
end

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
<<<<<<< HEAD
    restaurant = Restaurant.new(name: 'KF')
=======
    restaurant = Restaurant.new(name: 'kf')
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end

<<<<<<< HEAD
  it 'is needs to be a unique name' do
    Restaurant.create(name: 'KFC')
    restaurant = Restaurant.new(name: 'KFC')
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end
end



=======
  it 'is not valid unless it has a unique name' do
    Restaurant.create(name: "Moe's Tavern")
    restaurant = Restaurant.new(name: "Moe's Tavern")
    expect(restaurant).to have(1).error_on(:name)
  end
end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
