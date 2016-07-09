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
  validates :source, presence: true, length: {maximum: 255}
  validates :video_id, presence: true, length: {maximum: 255}
  validate :video_source_must_be_in_list,:video_id_must_match_pattern
	
  
	@@SOURCE_PATTERNS = Hash["youtube" => /^[A-Za-z0-9_-]{11}$/, "vimeo" => /^[0-9]*$/]
	
	def video_source_must_be_in_list
		if !@@SOURCE_PATTERNS.has_key?(source)
			errors.add(:source,"video is from an unsupported website")
		end
	end
	
	def video_id_must_match_pattern
		if @@SOURCE_PATTERNS.has_key?(source) and !@@SOURCE_PATTERNS[source].match(video_id)
			errors.add(:video_id,"invalid video link provided")
		end 
	end
	
	
end