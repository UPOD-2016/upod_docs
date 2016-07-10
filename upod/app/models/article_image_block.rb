# ArticleImageBlock is a more specific ArticleBlock.
# It inherits ArticleBlock's attributes, methods and validations. It also has a
# one-to-one connection with {Image}
# @see ArticleBlock
# @see Image
#
class ArticleImageBlock < ActiveRecord::Base
  belongs_to :image
  act_as :article_block
end
