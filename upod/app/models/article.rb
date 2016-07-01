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
  # This include is defined in the blockable.rb concern. Essentially, it
  # provides a nice interface to interact with the various types of article
  # blocks. Instead of having to use the ArticleTextBlock, you can now use
  # article.create_text_block, ArticleEquationBlock is now
  # article.create_equation_block and so on and so forth.
  include Blockable
  include Searchable

# validates the title and it's length
  validates :title, presence: true, length: { maximum: 255 }

  def self.create_from_sir_trevor sir_trevor_content
    data = JSON.parse(sir_trevor_content)['data']

    # If there are no blocks provided, we have to throw an error
    return if data.empty?

    #Otherwise, create the block
    article = Article.create(title: "blank for now #{Time.now}")

    data.each do |block|
      if block['type'] == 'text'
        article.create_text_block(body: block['data']['text'])
      end
    end

    article
  end

end
