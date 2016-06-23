# == Schema Information
#
# Table name: article_blocks
#
#  id           :integer          not null, primary key
#  position     :integer
#  article_id   :integer
#  actable_id   :integer
#  actable_type :string(255)
#

class ArticleBlock < ActiveRecord::Base
  actable
  belongs_to :article
  # The scope restricts it to the article id and actable id (block id) so
  acts_as_list scope: :article_id

  #validates the inputs of Position, actable_type
  validates :position, presence: true, uniqueness: true
  validates :actable_id, presence: true
  validates :actable_type, presence: true, length: { maximum: 255 }



end
