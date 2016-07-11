# A contributor is a user who has edited an article.
# @see User
#
# == Schema Information
#
# Table name: contributors
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  article_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Contributor < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  validates :user_id, presence: true
  validates :article_id, presence: true
end
