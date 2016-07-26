#
# author: Mike Roheer, Kieran O'Driscoll, Steven Swartz
#
# == Schema Information
#
# Table name: article_blocks
#
#  id           :integer          not null, primary key
#  position     :integer
#  article_id   :integer
#  actable_id   :integer          not null
#  actable_type :string(255)
#

require 'rails_helper'


RSpec.describe ArticleBlock, type: :model do

  let(:article) { create(:article) }
  describe "adding blocks to articles" do

    context "adding 1st block to article" do

# creates a test article and article block and tests whether position is 1
      it "should have position of 1" do
        article.create_text_block(body: "test")
        expect(article.blocks.first.position).to eq(1)
      end
    end
  end

# uses rspec to test if ArticleBlock is actable
  it { expect(ArticleBlock).to be_actable }

# uses shoulda matcher along with RSpec to test that ArticleBlock
# belongs to article.
  it { should belong_to(:article) }

end
