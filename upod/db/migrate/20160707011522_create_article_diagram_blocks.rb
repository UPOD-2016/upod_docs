class CreateArticleDiagramBlocks < ActiveRecord::Migration
  def change
    create_table :article_diagram_blocks do |t|
      t.integer :diagram_id

      t.timestamps null: false
    end
  end
end
