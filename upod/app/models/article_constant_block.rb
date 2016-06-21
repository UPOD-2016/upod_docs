class ArticleConstantBlock < ActiveRecord::Base
  belongs_to :constant
  acts_as :article_block
end
