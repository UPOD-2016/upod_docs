class AddPictureUrlToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :picture_url, :string
  end
end
