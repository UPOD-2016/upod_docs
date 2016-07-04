require 'rails_helper'


RSpec.describe ArticleBlock, type: :model do

  let(:article) { create(:article) }
  describe "adding blocks to articles" do

    context "adding 1st block to article" do

      it "should have position of 1" do
        article.create_text_block(body: "test")
        expect(article.blocks.first.position).to eq(1)
      end
    end
  end

  it { expect(ArticleBlock).to be_actable }

# uses shoulda matcher along with RSpec to test that ArticleBlock
# belongs to article.
  it { should belong_to(:article) }

end
