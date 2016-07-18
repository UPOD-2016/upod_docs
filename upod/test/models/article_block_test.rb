# == Schema Information
#
# Table name: article_blocks
#
#  id           :integer          not null, primary key
#  position     :integer
#  article_id   :integer
#  actable_id   :integer          not null
#  actable_type :string(255)
#

require 'test_helper'

class ArticleBlockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
