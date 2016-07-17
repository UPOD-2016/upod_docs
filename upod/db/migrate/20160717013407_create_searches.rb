class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :query
      t.datetime :searched_at
      t.datetime :converted_at
      t.integer :article_id

      t.timestamps null: false
    end
  end
end
