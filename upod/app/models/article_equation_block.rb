# ArticleEquationBlock is a more specific ArticleBlock. ArticleEquationBlock acts as an article block
# and it contains an equation (eg. E=mc^2). It inherits ArticleBlock's attributes, methods and validations.
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_equation_blocks
#
#  id          :integer          not null, primary key
#   - represents the id of the equation block
#
#  equation    :string(255)
#   - represents the equation stored in the block
#
#  description :string(255)
#   - represents the description of the equation
#
class ArticleEquationBlock < ActiveRecord::Base
  acts_as :article_block

# validates the length and presence of equation block and description
  validates :equation, presence: true, length: {maximum: 255}
  validates :label, presence: true, length: {maximum: 255}

end
