module Blockable
  extend ActiveSupport::Concern

  def create_text_block(body:)
    block = ArticleTextBlock.new(body: body)
    assign_article_id_and_save!(block)
  end
  def create_link_block(url:, label: nil)
    block = ArticleLinkBlock.new(url: url, label: label)
    assign_article_id_and_save!(block)
  end
  def create_equation_block(equation:, description: nil)
    block = ArticleEquationBlock.new(equation: equation, description: description)
    assign_article_id_and_save!(block)
  end
  def create_constant_block(constant:)
    block = ArticleConstantBlock.new(constant: constant)
    assign_article_id_and_save!(block)
  end

  private
    def assign_article_id_and_save!(block)
      block.article_id = self.id
      block.save!
    end
end