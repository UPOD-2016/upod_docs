# ArticleLinkBlock is a more specific ArticleBlock.
# It contains an id, a source and a video id. ArticleLinkBlock acts as an article block
# It inherits ArticleBlock's attributes, methods and validations.
# @see ArticleBlock
#
# == Schema Information
#
# Table name: article_link_blocks
#
#  id    :integer          not null, primary key
#   - represents the id of the link block
#
#  source :string(255)     not null
#   - represents where the video is coming from which is used to construct the URL. (Either youtube or vimeo)
#
#  video_id :string        not null
#   - represents the video id from the source which is used to construct the URL.
#

class ArticleLinkBlock < ActiveRecord::Base
  acts_as :article_block

# validates the presence and length of the url block and label
  validates :source, presence: true, length: {maximum: 255}
  validates :video_id, presence: true, length: {maximum: 255}
  validate :video_source_must_be_in_list,:video_id_must_match_pattern

# contains the accetptable sources and their corresponding character set for a valid video_id
	@@SOURCE_PATTERNS = Hash["youtube" => /^[A-Za-z0-9_-]{11}$/, "vimeo" => /^[0-9]*$/]


# Checks to see if the video source is either youtube or vimeo
#
# @return [Boolean] Whether the source was found in the hash
	def video_source_must_be_in_list
		if !@@SOURCE_PATTERNS.has_key?(source)
			errors.add(:source,"video is from an unsupported website")
		end
	end
# Checks to see if the video id is valid based on the video's source
#
# @return [Boolean] Whether the video id is valid
	def video_id_must_match_pattern
		if @@SOURCE_PATTERNS.has_key?(source) and !@@SOURCE_PATTERNS[source].match(video_id)
			errors.add(:video_id,"invalid video link provided")
		end
	end


end
