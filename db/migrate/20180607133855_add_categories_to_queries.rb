class AddCategoriesToQueries < ActiveRecord::Migration[5.1]
  def change
    add_reference :queries, :category, index: true, null: false, default: 0
  end
end
