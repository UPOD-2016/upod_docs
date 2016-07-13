# ArticleTestBlock is a more specific {ArticleBlock}.
# It contains an id and the body. ArticleTextBlock acts as an article block
# It inherits ArticleBlock's attributes, methods and validations.
# The body of the text block is {Searchable}
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_text_blocks
#
#  id   :integer          not null, primary key
#  body :text(65535)
#
class ArticleTextBlock < ActiveRecord::Base
  acts_as :article_block

# validates the presence and length of the body of title block
  validates :body, presence: true, length: { maximum: 65535 }

 include Searchable
end
