class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.text :body
      t.string :label

      t.timestamps null: false
    end
  end
end
