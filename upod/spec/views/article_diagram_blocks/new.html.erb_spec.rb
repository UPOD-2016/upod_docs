require 'rails_helper'

RSpec.describe "article_diagram_blocks/new", type: :view do
  before(:each) do
    assign(:article_diagram_block, ArticleDiagramBlock.new(
      :show => "MyString"
    ))
  end

  it "renders new article_diagram_block form" do
    render

    assert_select "form[action=?][method=?]", article_diagram_blocks_path, "post" do

      assert_select "input#article_diagram_block_show[name=?]", "article_diagram_block[show]"
    end
  end
end
