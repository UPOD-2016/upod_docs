require 'rails_helper'

RSpec.describe "articles/article_link_blocks/index", type: :view do
  before(:each) do
    assign(:articles_article_link_blocks, [
      Articles::ArticleLinkBlock.create!(
        :show => "Show"
      ),
      Articles::ArticleLinkBlock.create!(
        :show => "Show"
      )
    ])
  end

  it "renders a list of articles/article_link_blocks" do
    render
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
