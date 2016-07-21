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
  include SirTrevorable

  searchkick searchable: ["title","body","label"],
    match: :word_start,
    suggest: ["body"],
    callbacks: :async,
    conversions: :converstions

    before_save :update_slug

    extend FriendlyId
    friendly_id :title, use: [:slugged, :finders]

    def should_generate_new_friendly_id?
      new_record?
    end

    def update_slug
      self.slug = title.parameterize
    end


  def search_data
    {
        title: title,
        body: blocks.map { |block| block.specific.body if block.specific.respond_to?(:body)}.as_json,
        label: blocks.map { |block| block.specific.label if block.specific.respond_to?(:label)}.as_json,
        conversions: searches.group("query").count
    }
  end

  # validates the title and it's length
  validates :title, presence: true, length: { maximum: 255 }
end
