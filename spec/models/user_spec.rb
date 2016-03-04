require 'rails_helper'

<<<<<<< HEAD
  describe User, type: :model do

  it {is_expected.to have_many :restaurants}
  it {is_expected.to have_many :reviews}
  it {is_expected.to have_many :reviewed_restaurants}



end
=======
RSpec.describe User, type: :model do  
  it { is_expected.to have_many :restaurants }
  it { is_expected.to have_many :reviews }
  it { is_expected.to have_many :reviewed_restaurants}
end

>>>>>>> b7fbbf4dfee6277dab38934bcedbf9cf3f3fbe9a
