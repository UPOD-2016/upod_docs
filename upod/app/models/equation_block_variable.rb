#
# author: Mike Roheer, Kieran O'Driscoll (Validations), Steven Swartz
#
class EquationBlockVariable < ActiveRecord::Base
  belongs_to :article_equation_block, dependent: :destroy

  validates :variable, presence: true, length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 255}

  #Used when editing article_equation_blocks with sir trevor
  def as_json
	{
		variable: variable,
		description: description
	}
  end
end
