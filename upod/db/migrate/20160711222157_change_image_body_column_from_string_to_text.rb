class ChangeImageBodyColumnFromStringToText < ActiveRecord::Migration
  def up
    change_column :images, :body, :text
  end
  def down
    change_column :images, :body, :string
  end
end
