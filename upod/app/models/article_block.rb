class ArticleBlock < ActiveRecord::Base
  actable
  belongs_to :article
end
