require 'rails_helper'

RSpec.describe ArticleLinkBlock, type: :model do

# uses shoulda matcher along with RSpec to validate and test the presence of
# the url, source and video id in the ArticleLinkBlock. As well as if it
# acts as an article_block
  it { is_expected.to validate_presence_of(:source) }
  it { is_expected.to validate_presence_of(:video_id) }
  it { is_expected.to act_as(:article_block) }

# uses shoulda matcher along with RSpec to validate and test the length of
# the source in the ArticleLinkBlock
  it do
    should validate_length_of(:source).
      is_at_most(255).
      on(:create)
  end

  # uses shoulda matcher along with RSpec to validate and test the length of
  # the video_id in the ArticleLinkBlock
    it do
      should validate_length_of(:video_id).
        is_at_most(255).
        on(:create)
    end

end
