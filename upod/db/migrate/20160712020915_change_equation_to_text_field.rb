class ChangeEquationToTextField < ActiveRecord::Migration
  def change
	change_column :article_equation_blocks, :equation, :text
  end
end
