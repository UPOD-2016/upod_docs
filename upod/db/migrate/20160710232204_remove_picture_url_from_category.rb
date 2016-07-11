class RemovePictureUrlFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :picture_url, :string
  end
end
