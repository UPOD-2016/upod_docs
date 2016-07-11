module Blockable
  extend ActiveSupport::Concern

  def create_text_block(body:)
    article_block = ArticleTextBlock.new(body: body)
    assign_article_id_and_save!(article_block)
  end
  def create_link_block(source:, video_id:)
    article_block = ArticleLinkBlock.new(source: source, video_id: video_id)
    assign_article_id_and_save!(article_block)
  end
  def create_image_block(image:)
    article_block = ArticleImageBlock.new(image: image)
    assign_article_id_and_save!(article_block)
  end
  def create_equation_block(equation:, description: nil)
    article_block = ArticleEquationBlock.new(equation: equation, description: description)
    assign_article_id_and_save!(article_block)
  end
  def create_constant_block(constant:)
    article_block = ArticleConstantBlock.new(constant: constant)
    assign_article_id_and_save!(article_block)
  end

  private
    def assign_article_id_and_save!(article_block)
      article_block.article_id = self.id
      article_block.save!
    end
end