class ChangeActtableAttributes < ActiveRecord::Migration
  def change
    change_column_null :article_blocks, :actable_id, false
    add_index :article_blocks, :actable_id
  end
end
