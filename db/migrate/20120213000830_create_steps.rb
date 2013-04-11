class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :id
      t.integer :article_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
