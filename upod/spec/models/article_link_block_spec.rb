require 'rails_helper'

RSpec.describe ArticleLinkBlock, type: :model do

# uses shoulda matcher along with RSpec to validate and test the presence of
# the url and label in the ArticleLinkBlock
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:label) }

# uses shoulda matcher along with RSpec to validate and test the length of
# the url in the ArticleLinkBlock
  it do
    should validate_length_of(:url).
      is_at_most(255).
      on(:create)
  end

# uses shoulda matcher along with RSpec to validate and test the length of
# the url in the ArticleLinkBlock
  it do
    should validate_length_of(:label).
      is_at_most(255).
      on(:create)
  end
end
