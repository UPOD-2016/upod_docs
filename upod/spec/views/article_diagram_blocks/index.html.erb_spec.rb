require 'rails_helper'

RSpec.describe "article_diagram_blocks/index", type: :view do
  before(:each) do
    assign(:article_diagram_blocks, [
      ArticleDiagramBlock.create!(
        :show => "Show"
      ),
      ArticleDiagramBlock.create!(
        :show => "Show"
      )
    ])
  end

  it "renders a list of article_diagram_blocks" do
    render
    assert_select "tr>td", :text => "Show".to_s, :count => 2
  end
end
