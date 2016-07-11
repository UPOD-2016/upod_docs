# ArticleDiagramBlock is a more specific {ArticleBlock}.
# It contains a diagram ID which links to a specific diagram
# ArticleDigramBlock belongs to {Diagram} and acts as an article block.
# It inherits ArticleBlock's attributes, methods and validations. As well
# has a one-to-one connections with {Diagram}.
# @see Diagram
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_diagram_blocks
#
#  diagram_id         :integer(4)       primary key
#   - represents the diagram id of the associated with the block
#
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class ArticleDiagramBlock < ActiveRecord::Base
  belongs_to :diagram
  acts_as :article_block
end
