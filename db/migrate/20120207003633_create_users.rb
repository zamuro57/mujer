class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :id
      t.string :user_name
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
