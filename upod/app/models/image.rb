# An image can belong to many {ArticleImageBlock} so that images can be reused throughout
# articles. The uploader used is {SirTrevorImageUploader}.
# @see ArticleImageBlock
#
# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  body       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ActiveRecord::Base
  has_many :article_image_blocks
  mount_uploader :body, SirTrevorImageUploader

  validates :body, presence: true

  def self.create_from_filepath(filepath)
    img = Image.new
    img.body = filepath
    img.save!

    img
  end

end
