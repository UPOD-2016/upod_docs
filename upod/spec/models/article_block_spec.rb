require 'rails_helper'
require "active_record/acts_as/matchers"

RSpec.describe ArticleBlock, type: :model do

# uses shoulda matcher along with RSpec to test the presence and
# uniqueness of the ArticleBlocks' position, actable_id, actable_type
  it { is_expected.to validate_presence_of(:position) }
  it { is_expected.to validate_uniqueness_of(:position) }
  it { is_expected.to validate_presence_of(:actable_id) }
  it { is_expected.to validate_presence_of(:actable_type) }
  it { expect(ArticleBlock).to be_actable }

# uses shoulda matcher along with RSpec to test that ArticleBlock
# belongs to article.
  it { should belong_to(:article) }

end
