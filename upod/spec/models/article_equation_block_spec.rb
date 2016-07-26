#
# author: Michael Roher, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: article_equation_blocks
#
#  id       :integer          not null, primary key
#  equation :string(255)
#  label    :string(255)
#

require 'rails_helper'

RSpec.describe ArticleEquationBlock, type: :model do

# uses shoulda matcher along with rspec to test and validate the presence
# of equation and label in the ArticleEquationBlock.
  it { is_expected.to validate_presence_of(:equation) }
  it { is_expected.to validate_presence_of(:label) }
  it { is_expected.to act_as(:article_block) }

# uses shoulda matcher along with rspec to test and validate the length of
# the label in the ArticleEquationBlock
  it do
    should validate_length_of(:label).
      is_at_most(255).
      on(:create)
  end


end
