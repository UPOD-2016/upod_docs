class RemoveImageUrlFromCategory < ActiveRecord::Migration
  def change
    remove_column :categories, :image_url, :string
  end
end
