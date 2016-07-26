#
# author: Michael Roher, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: article_text_blocks
#
#  id   :integer          not null, primary key
#  body :text(65535)
#

require 'rails_helper'

RSpec.describe ArticleTextBlock, type: :model do


# uses shoulda matcher as well as RSpec to validate and test the presence
# of the body of an ArticleTextBlock
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to act_as(:article_block) }

# uses shoulda matcher as well as RSpec to validate and test the length
# of the body of an ArticleTextBlock
  it do
    should validate_length_of(:body).
      is_at_most(65535).
      on(:create)
  end



end
