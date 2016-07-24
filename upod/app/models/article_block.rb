# An article is made up of many ArticleBlocks. This class is the parent
# class of various types of article blocks (ArticleBlock is actable). Other
# article blocks inherit ArticleBlock's attributes, methods and validations.
# Each ArticleBlock has a one-to-one connection with an {Article}
# @see Article
# @see ArticleConstantBlock
# @see ArticleDiagramBlock
# @see ArticleEquationBlock
# @see ArticleImageBlock
# @see ArticleLinkBlock
# @see ArticleTextBlock
#
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

class ArticleBlock < ActiveRecord::Base

  # sets ArticleBlock to actable
  actable
  # Makes ArticleBlock belong to Article
  belongs_to :article
  # The scope restricts it to the article id
  acts_as_list scope: :article_id

  # Used to resolve partials in views e.g. ArticleTextBlock => text_block
  def slug
    self.specific.class.to_s.underscore.split('article_').last
  end
  

end
