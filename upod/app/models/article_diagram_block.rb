# ArticleConstantBlock is a more specific ArticleBlock.
# It contains a constant ID which links to a specific constant (eg. gravity).
# ArticleConstantBlock belongs to Consant and acts as an article block.
# It inherits ArticleBlock's attributes, methods and validations. As well
# has a one-to-one connections with diagram.
# @see Diagram
# @see ArticleBlock
#
class ArticleDiagramBlock < ActiveRecord::Base
  belongs_to :diagram
  acts_as :article_block
end
