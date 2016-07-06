# == Schema Information
#
# Table name: article_link_blocks
#
#  id    :integer          not null, primary key
#  url   :string(255)
#  source :string(255)     not null
#  video_id :string        not null
#

class ArticleLinkBlock < ActiveRecord::Base
  acts_as :article_block

# validates the presence and length of the url block and label
  validates :url, presence: true, length: {maximum: 255}
  validates :source, presence: true, length: {maximum: 255}
  validates :video_id, presence: true, length: {maximum: 255}



end
