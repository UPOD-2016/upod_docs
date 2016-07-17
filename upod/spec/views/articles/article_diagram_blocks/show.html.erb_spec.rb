require 'rails_helper'

RSpec.describe "articles/article_diagram_blocks/show", type: :view do
  before(:each) do
    @articles_article_diagram_block = assign(:articles_article_diagram_block, Articles::ArticleDiagramBlock.create!(
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Show/)
  end
end
