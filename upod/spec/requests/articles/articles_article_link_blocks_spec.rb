require 'rails_helper'

RSpec.describe "Articles::ArticleLinkBlocks", type: :request do
  describe "GET /articles_article_link_blocks" do
    it "works! (now write some real specs)" do
      get articles_article_link_blocks_path
      expect(response).to have_http_status(200)
    end
  end
end
