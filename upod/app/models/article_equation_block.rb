# == Schema Information
#
# Table name: article_equation_blocks
#
#  id          :integer          not null, primary key
#  equation    :string(255)
#  description :string(255)
#

class ArticleEquationBlock < ActiveRecord::Base
  acts_as :article_block

  validates :equation, presence: true, length: {maximum: 255}
  validates :descripton, presence: true, length: {maximum: 255}

end
