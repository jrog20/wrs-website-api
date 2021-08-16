class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :date
      t.text :body
      t.string :tags
      t.string :categories

      t.timestamps
    end
  end
end
