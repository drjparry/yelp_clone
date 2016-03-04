require 'rails_helper'

RSpec.describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }
  it { is_expected.to belong_to :user }
end

describe Review, type: :model do
  it 'is invalid if the rating is between 1 and 5 (inclusive)' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  describe '#average_rating' do
    context 'No reviews' do
      it 'returns "N/A" when there are no reviews' do
      restaurant = Restaurant.create(name: 'Ivy')
      expect(restaurant.average_rating).to eq 'N/A'
      end
    end
  end
end
