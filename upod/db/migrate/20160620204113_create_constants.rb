class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.string :name
      t.text :description
      t.decimal :value

      t.timestamps null: false
    end
  end
end
