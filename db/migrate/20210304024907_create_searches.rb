class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :book_search
      t.string :user_search

      t.timestamps
    end
  end
end
