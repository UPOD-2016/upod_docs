# ArticleImageBlock is a more specific ArticleBlock.
# It inherits ArticleBlock's attributes, methods and validations.
# @see ArticleBlock
#
class ArticleImageBlock < ActiveRecord::Base
  belongs_to :image
end
