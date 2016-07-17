require 'rails_helper'

RSpec.describe "articles/article_link_blocks/show", type: :view do
  before(:each) do
    @articles_article_link_block = assign(:articles_article_link_block, Articles::ArticleLinkBlock.create!(
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Show/)
  end
end
