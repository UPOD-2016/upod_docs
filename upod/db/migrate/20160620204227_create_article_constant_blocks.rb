class CreateArticleConstantBlocks < ActiveRecord::Migration
  def change
    create_table :article_constant_blocks do |t|
      t.integer :constant_id
    end
  end
end
