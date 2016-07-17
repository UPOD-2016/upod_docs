require 'rails_helper'

RSpec.describe "articles/article_diagram_blocks/new", type: :view do
  before(:each) do
    assign(:articles_article_diagram_block, Articles::ArticleDiagramBlock.new(
      :show => "MyString"
    ))
  end

  it "renders new articles_article_diagram_block form" do
    render

    assert_select "form[action=?][method=?]", articles_article_diagram_blocks_path, "post" do

      assert_select "input#articles_article_diagram_block_show[name=?]", "articles_article_diagram_block[show]"
    end
  end
end
