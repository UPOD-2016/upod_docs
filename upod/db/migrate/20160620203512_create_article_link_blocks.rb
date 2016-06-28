class CreateArticleLinkBlocks < ActiveRecord::Migration
  def change
    create_table :article_link_blocks do |t|
      t.string :url
      t.string :label
    end
  end
end
