require 'rails_helper'

RSpec.describe Article, type: :model do

# uses shoulda matcher along with RSpec to test the presence of the title
# in the Article
  it { is_expected.to validate_presence_of(:title) }

# uses shoulda matcher along with RSpec to test the length of the title
# in the Article
  it do
    should validate_length_of(:title).
      is_at_most(255).
      on(:create)
  end

# uses shoulda matcher along with RSpec to test the association
# of article. An article has many blocks.
  it { should have_many(:blocks) }

end
