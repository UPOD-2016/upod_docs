#
# author: Mike Roheer, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: article_image_blocks
#
#  id         :integer          not null, primary key
#  image_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ArticleImageBlock, type: :model do
  it { is_expected.to act_as(:article_block) }
  it { should belong_to(:image) }
end
