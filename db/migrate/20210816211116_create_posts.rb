class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.text :body
      t.string :tags, array: true, default: []
      t.string :categories, array: true, default: []
      t.timestamps
    end
  end
end
