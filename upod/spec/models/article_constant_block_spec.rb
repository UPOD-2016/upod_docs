require 'rails_helper'

RSpec.describe ArticleConstantBlock, type: :model do

# Uses shoulda matcher along with rspec to test and validate the uniqueness
# and presence of constant_id and id in the ArticleConstantBlock
  it { is_expected.to validate_presence_of(:constant_id) }
  it { is_expected.to validate_presence_of(:id) }
  it { is_expected.to validate_uniqueness_of(:id) }
end
