# == Schema Information
#
# Table name: article_constant_blocks
#
#  id          :integer          not null, primary key
#  constant_id :integer
#

class ArticleConstantBlock < ActiveRecord::Base
  belongs_to :constant
  acts_as :article_block

# validates the presence of constant_id and id as well as
# the uniqueness of the ID for the constant block
  validates :constant_id, presence: true
  validates :id, presence: true, uniqueness: true

end
