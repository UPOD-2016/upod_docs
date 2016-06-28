class RenameDescriptionColumnEquationBlock < ActiveRecord::Migration
  def change
# changes the column name from description to label for
# article_equation_blocks table
    rename_column :article_equation_blocks, :description, :label
  end
end
