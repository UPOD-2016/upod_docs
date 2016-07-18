require 'rails_helper'

RSpec.describe "articles/article_diagram_blocks/edit", type: :view do
  before(:each) do
    @articles_article_diagram_block = assign(:articles_article_diagram_block, Articles::ArticleDiagramBlock.create!(
      :show => "MyString"
    ))
  end

  it "renders the edit articles_article_diagram_block form" do
    render

    assert_select "form[action=?][method=?]", articles_article_diagram_block_path(@articles_article_diagram_block), "post" do

      assert_select "input#articles_article_diagram_block_show[name=?]", "articles_article_diagram_block[show]"
    end
  end
end
