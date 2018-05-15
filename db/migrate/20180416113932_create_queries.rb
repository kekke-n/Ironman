class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.string :title
      t.text :sql

      t.timestamps
    end
  end
end
