# == Schema Information
#
# Table name: article_text_blocks
#
#  id   :integer          not null, primary key
#  body :text(65535)
#

class ArticleTextBlock < ActiveRecord::Base
  acts_as :article_block
end
