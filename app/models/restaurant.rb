class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, length: {minimum: 3}, uniqueness: true

  def build_review(review_data={}, reviewer)
    review_data[:user] ||= reviewer
    reviews.build(review_data)
  end

  def average_rating
    return 'N/A' if reviews.none?
   # reviews.inject(0){|memo, review| memo + review.rating}/reviews.count
   reviews.average(:rating)
  end
end
