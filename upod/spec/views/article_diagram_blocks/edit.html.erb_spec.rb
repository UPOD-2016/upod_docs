require 'rails_helper'

RSpec.describe "article_diagram_blocks/edit", type: :view do
  before(:each) do
    @article_diagram_block = assign(:article_diagram_block, ArticleDiagramBlock.create!(
      :show => "MyString"
    ))
  end

  it "renders the edit article_diagram_block form" do
    render

    assert_select "form[action=?][method=?]", article_diagram_block_path(@article_diagram_block), "post" do

      assert_select "input#article_diagram_block_show[name=?]", "article_diagram_block[show]"
    end
  end
end
