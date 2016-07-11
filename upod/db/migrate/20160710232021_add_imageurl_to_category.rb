class AddImageurlToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :image_url, :string
  end
end
