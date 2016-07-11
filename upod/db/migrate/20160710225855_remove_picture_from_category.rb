class RemovePictureFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :picture, :binary
  end
end
