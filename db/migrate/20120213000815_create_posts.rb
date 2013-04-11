class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
