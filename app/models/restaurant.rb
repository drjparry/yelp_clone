class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true
<<<<<<< HEAD
=======

  def build_review(review_data={}, reviewer)
    review_data[:user] ||= reviewer
    reviews.build(review_data)

    # @review = restaurant.reviews.new(review_data)
    # puts "@review: #{@review}"
    # @review.user= reviewer
    # puts "@review.user: #{@review.user}"
  end
>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
end
