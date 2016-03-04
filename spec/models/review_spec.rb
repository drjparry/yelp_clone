require 'rails_helper'

<<<<<<< HEAD
describe Review, type: :model do

  it {is_expected.to belong_to :restaurant}
  it {is_expected.to belong_to :user}

  it 'is invalid if the rating is more than 5' do
    review = Review.new(rating: 6)
    expect(review).to have(1).error_on(:rating)
  end
end
=======
RSpec.describe Review, type: :model do
  it { is_expected.to belong_to :restaurant }
  it { is_expected.to belong_to :user }
end

describe Review, type: :model do
  it 'is invalid if the rating is between 1 and 5 (inclusive)' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end
end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
