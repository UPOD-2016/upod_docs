# An Article is made up of many blocks and is the complete model. It contains various blocks that make up
# its' look and feel.
# An Article is {Blockable} as well as {Searchable}
#
# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#   - represents the id of the article
#
#  title      :string(255)
#   - represents the tile of the article.
#
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ActiveRecord::Base
  has_many :blocks, class_name: 'ArticleBlock', foreign_key: :article_id
  has_many :contributions, class_name: 'Contributor', foreign_key: :article_id
  has_many :categorizations
  has_many :subcategories, :through => :categorizations
  # This include is defined in the blockable.rb concern. Essentially, it
  # provides a nice interface to interact with the various types of article
  # blocks. Instead of having to use the ArticleTextBlock, you can now use
  # article.create_text_block, ArticleEquationBlock is now
  # article.create_equation_block and so on and so forth.
  include Blockable
  include Searchable

# validates the title and it's length
  validates :title, presence: true, length: { maximum: 255 }

# Creates the Articles blocks using sir trevor
#
# @todo Document method
# @todo complete image handling
  def self.create_from_sir_trevor sir_trevor_content
    data = JSON.parse(sir_trevor_content)['data']

    # If there are no blocks provided, we have to throw an error
    return if data.empty?

    #Otherwise, create the block
    article = Article.create(title: "blank for now #{Time.now}")

    data.each do |block|
      case block['type'].to_sym
      when :text
        article.create_text_block(body: block['data']['text'])
      when :image
        # This needs to be changed. Right now, the issue is that the
        # images are uploaded aysycnrhousnously - that is the images
        # are uploaded before the articles are created. So, there needs
        # to be a way to find the image or notify from the ImagesController.
        # TO COME BACK TO THIS. Moving on for now. THIS IS NOT FINISHED!
        article.create_image_block(Image.last)
      when :video
		    article.create_link_block(source: block['data']['source'], video_id: block['data']['remote_id'])
	    end
    end

    article
  end

end
