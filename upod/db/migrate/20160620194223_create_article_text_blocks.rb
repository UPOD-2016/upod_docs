class CreateArticleTextBlocks < ActiveRecord::Migration
  def change
    create_table :article_text_blocks do |t|
      t.text :body
      # No timestamps because they are inherited from parent table.
      # t.timestamps null: false
    end
  end
end
