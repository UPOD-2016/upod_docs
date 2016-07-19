class AddVariableCascadeOnDeleteFkRelation < ActiveRecord::Migration
  def change
	#variables get deleted when the equation_block they reference are deleted
	remove_foreign_key :equation_block_variables, :article_equation_blocks
	add_foreign_key :equation_block_variables, :article_equation_blocks, depedent: :delete
  end
end
