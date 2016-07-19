class EquationBlockVariable < ActiveRecord::Base
  belongs_to :article_equation_block, dependent: :destroy
  
  validates :variable, presence: true, length: {maximum: 255}
  validates :description, presence: true, length: {maximum: 255}
  
end
