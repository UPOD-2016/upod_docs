class CreateArticleEquationBlocks < ActiveRecord::Migration
  def change
    create_table :article_equation_blocks do |t|
      t.string :equation
      t.string :label
    end
  end
end
