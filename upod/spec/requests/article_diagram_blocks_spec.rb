require 'rails_helper'

RSpec.describe "ArticleDiagramBlocks", type: :request do
  describe "GET /article_diagram_blocks" do
    it "works! (now write some real specs)" do
      get article_diagram_blocks_path
      expect(response).to have_http_status(200)
    end
  end
end
