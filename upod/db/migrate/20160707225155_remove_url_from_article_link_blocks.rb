class RemoveUrlFromArticleLinkBlocks < ActiveRecord::Migration
  def change
	remove_column :article_link_blocks, :url, :string
  end
end
