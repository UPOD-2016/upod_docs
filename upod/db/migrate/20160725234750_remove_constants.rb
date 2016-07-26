class RemoveConstants < ActiveRecord::Migration
  def change
    drop_table :constants
    drop_table :article_constant_blocks
  end
end
