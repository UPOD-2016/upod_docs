class CreateEquationBlockVariables < ActiveRecord::Migration
  def change
    create_table :equation_block_variables do |t|
      t.string :variable
      t.string :description
      t.belongs_to :article_equation_block, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
