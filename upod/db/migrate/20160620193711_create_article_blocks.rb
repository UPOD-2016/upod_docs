class CreateArticleBlocks < ActiveRecord::Migration
  def change
    create_table :article_blocks do |t|
      t.integer :position
      t.integer :article_id
      t.integer :actable_id
      t.string :actable_type
      # No timestamps because they are inherited from parent table.
    end
  end
end
