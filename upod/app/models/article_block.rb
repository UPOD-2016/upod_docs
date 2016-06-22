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
  acts_as_list scope: [:actable_id, :actable_type]
end
