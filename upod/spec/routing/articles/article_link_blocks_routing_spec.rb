require "rails_helper"

RSpec.describe Articles::ArticleLinkBlocksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/articles/article_link_blocks").to route_to("articles/article_link_blocks#index")
    end

    it "routes to #new" do
      expect(:get => "/articles/article_link_blocks/new").to route_to("articles/article_link_blocks#new")
    end

    it "routes to #show" do
      expect(:get => "/articles/article_link_blocks/1").to route_to("articles/article_link_blocks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/articles/article_link_blocks/1/edit").to route_to("articles/article_link_blocks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/articles/article_link_blocks").to route_to("articles/article_link_blocks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/articles/article_link_blocks/1").to route_to("articles/article_link_blocks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/articles/article_link_blocks/1").to route_to("articles/article_link_blocks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/articles/article_link_blocks/1").to route_to("articles/article_link_blocks#destroy", :id => "1")
    end

  end
end
