# An article is made up for many ArticleBlocks. This class is the parent
# class of various types of article blocks (ArticleBlock is actable). Other
# article blocks inherit ArticleBlock's attributes, methods and validations.
# Each ArtcleBlock has a one-to-one connection with an Article
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
#   - represents the id of the article block
#
#  position     :integer
#   - represents the position of the block in the article (eg. first position)
#
#  article_id   :integer
#   - represents the id of the aricle the block belongs to
#
#  actable_id   :integer
#  actable_type :string(255)
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
