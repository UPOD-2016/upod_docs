# An Article is made up of many blocks and is the complete model. It contains various blocks that make up
# its' look and feel.
# An Article is {Blockable} as well as {Searchable}
#
# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Article < ActiveRecord::Base
  has_many :blocks, class_name: 'ArticleBlock', foreign_key: :article_id
  has_many :contributions, class_name: 'Contributor', foreign_key: :article_id
  has_many :categorizations
  has_many :subcategories, :through => :categorizations
  has_many :searches
  # This include is defined in the blockable.rb concern. Essentially, it
  # provides a nice interface to interact with the various types of article
  # blocks. Instead of having to use the ArticleTextBlock, you can now use
  # article.create_text_block, ArticleEquationBlock is now
  # article.create_equation_block and so on and so forth.
  include Blockable


  searchkick searchable: ["title", "body"],
    match: :word_start,
    suggest: ["title"],
    callbacks: :async,
    conversions: "conversions"



  def search_data
      body = Article.first.blocks.select { |block| block.is_a? ArticleTextBlock}.map(&:body)
      {
          title: title,
          body: body,
          conversions: searches.group("query").count
      }
  end

  # validates the title and it's length
  validates :title, presence: true, length: { maximum: 255 }

  # Creates the Articles blocks using sir trevor
  #
  # @todo Document method
  # @todo complete image handling
  def self.create_from_sir_trevor sir_trevor_content
    json = JSON.parse(sir_trevor_content)
    meta = json['meta']

    data = json['data']
    # If there are no blocks provided, we have to throw an error
    return if data.empty?

    #Otherwise, create the block
    article = Article.create(title: meta['title'])

    data.each do |block|
      case block['type'].to_sym
      when :text
        article.create_text_block(body: block['data']['text'])
      when :image
        article.create_image_block(image: Image.find(block['data']['id']))
      when :video
        article.create_link_block(source: block['data']['source'], video_id: block['data']['remote_id'])
      when :equation
        article.create_equation_block(equation: block['data']['equation'], label: block['data']['label'])
	  when :diagram
        article.create_diagram_block(code: block['data']['code'], caption: block['data']['caption'])
      end
    end

    meta['subcategories'].each do |subcategory_id|
      article.categorizations.create(subcategory_id: subcategory_id)
    end

    article
  end

  def to_sir_trevor
    {data: self.blocks.collect { |block| block.specific.as_json } }.to_json
  end
end
