module ReviewsHelper

  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button "Leave Review"
  end

  def star_rating(rating)
    return rating unless rating.respond_to?(:round)
     remainder = (5 - rating)
     '★' * rating.round + '☆' * remainder
  end
end


