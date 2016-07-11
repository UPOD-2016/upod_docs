class RemovePictureurlFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :pictureurl, :string
  end
end
