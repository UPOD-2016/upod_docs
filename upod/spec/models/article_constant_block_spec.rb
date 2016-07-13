# == Schema Information
#
# Table name: article_constant_blocks
#
#  id          :integer          not null, primary key
#  constant_id :integer
#

require 'rails_helper'


RSpec.describe ArticleConstantBlock, type: :model do

# Uses shoulda matcher along with rspec to test and validate the uniqueness
# and presence of constant_id and id in the ArticleConstantBlock
  it { is_expected.to validate_presence_of(:constant_id) }
  it { is_expected.to validate_presence_of(:id) }
  it { is_expected.to validate_uniqueness_of(:id) }
  it { is_expected.to act_as(:article_block) }

# uses shoulda matcher along with RSpec to test that ArticleBlock
# belongs to article_block.
  it { should belong_to(:constant) }



end
