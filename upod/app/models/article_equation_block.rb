# ArticleEquationBlock is a more specific {ArticleBlock}. ArticleEquationBlock acts as an article block
# and it contains an equation (eg. E=mc^2) and a description of that equation.
# It inherits ArticleBlock's attributes, methods and validations.
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_equation_blocks
#
#  id       :integer          not null, primary key
#  equation :text
#  label    :string(255)
#

class ArticleEquationBlock < ActiveRecord::Base
  acts_as :article_block
  has_many :equation_block_variables, dependent: :destroy

# validates the length and presence of equation block and description
  validates :equation, presence: true, length: {maximum: 65535}
  validates :label, presence: true, length: {maximum: 255}
  
  # Used by SirTrevor for editing this block
  def as_json
  
	#Get each variable associated with this equation and add each of their hashes to the variables hash
	variables = Hash.new
	self.equation_block_variables.each_with_index {|variable,index| variables[index] = variable.as_json}
	
	{
		type: :equation,
		data: {
			equation: equation,
			label: label,
			variables: variables
		}
	}
  end

end
