require 'rails_helper'

RSpec.describe "article_diagram_blocks/show", type: :view do
  before(:each) do
    @article_diagram_block = assign(:article_diagram_block, ArticleDiagramBlock.create!(
      :show => "Show"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Show/)
  end
end
