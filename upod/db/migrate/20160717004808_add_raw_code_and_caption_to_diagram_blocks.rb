class AddRawCodeAndCaptionToDiagramBlocks < ActiveRecord::Migration
  def change
	add_column :article_diagram_blocks, :code, :text
	add_column :article_diagram_blocks, :caption, :string
  end
end
