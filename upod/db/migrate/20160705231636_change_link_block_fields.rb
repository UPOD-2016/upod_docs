class ChangeLinkBlockFields < ActiveRecord::Migration
  def change
    #what website is it from? (youtube, vimeo, etc.)
    rename_column :article_link_blocks, :label, :source
    
    #video_id is needed to embed the video in an iframe
    add_column :article_link_blocks, :video_id, :string
    
    #make these fields required
    change_column_null :article_link_blocks, :video_id, false
  end
end
