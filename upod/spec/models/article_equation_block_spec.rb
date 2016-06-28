require 'rails_helper'

RSpec.describe ArticleEquationBlock, type: :model do

# uses shoulda matcher along with rspec to test and validate the presence
# of equation and description in the ArticleEquationBlock.
  it { is_expected.to validate_presence_of(:equation) }
  it { is_expected.to validate_presence_of(:label) }

# uses shoulda matcher along with rspec to test and validate the length of
# the equation in the ArticleEquationBlock
  it do
    should validate_length_of(:equation).
      is_at_most(255).
      on(:create)
  end

# uses shoulda matcher along with rspec to test and validate the length of
# the description in the ArticleEquationBlock
  it do
    should validate_length_of(:label).
      is_at_most(255).
      on(:create)
  end


end
