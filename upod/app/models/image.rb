class Image < ActiveRecord::Base
  has_many :article_image_blocks
  mount_uploader :body, SirTrevorImageUploader
end
