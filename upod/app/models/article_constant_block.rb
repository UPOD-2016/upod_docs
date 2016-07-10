# ArticleConstantBlock is a more specific ArticleBlock.
# It contains a constant ID which links to a specific constant (eg. gravity).
# ArticleConstantBlock belongs to Consant and acts as an article block.
# It inherits ArticleBlock's attributes, methods and validations. Has a one-to-one
# connection with Constant.
# @see Constant
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_constant_blocks
#
#  id          :integer          not null, primary key
#     - represents the id of the constant block
#
#  constant_id :integer
#     - represents the id of the constant contained in the block
#
class ArticleConstantBlock < ActiveRecord::Base
  belongs_to :constant
  acts_as :article_block

# validates the presence of constant_id and id as well as
# the uniqueness of the ID for the constant block
  validates :constant_id, presence: true
  validates :id, presence: true, uniqueness: true

end
