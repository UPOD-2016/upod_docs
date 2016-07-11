class CreateArticleImageBlocks < ActiveRecord::Migration
  def change
    create_table :article_image_blocks do |t|
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
