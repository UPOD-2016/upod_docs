require 'rails_helper'

RSpec.describe "articles/article_diagram_blocks/index", type: :view do
  before(:each) do
    assign(:articles_article_diagram_blocks, [
      Articles::ArticleDiagramBlock.create!(
        :show => "Show"
      ),
      Articles::ArticleDiagramBlock.create!(
        :show => "Show"
      )
    ])
  end

  it "renders a list of articles/article_diagram_blocks" do
    render
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
