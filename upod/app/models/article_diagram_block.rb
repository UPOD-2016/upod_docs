class ArticleDiagramBlock < ActiveRecord::Base
  belongs_to :diagram
  acts_as :article_block
end
