require 'rails_helper'

RSpec.describe ArticleTextBlock, type: :model do


# uses shoulda matcher as well as RSpec to validate and test the presence
# of the body of an ArticleTextBlock
  it { is_expected.to validate_presence_of(:body) }

# uses shoulda matcher as well as RSpec to validate and test the length
# of the body of an ArticleTextBlock
  it do
    should validate_length_of(:body).
      is_at_most(65535).
      on(:create)
  end



end
