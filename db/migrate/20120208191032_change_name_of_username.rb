class ChangeNameOfUsername < ActiveRecord::Migration
  def up
    remove_column('users','first_name')
    remove_column('users','last_name')
    rename_column('users','user_name','username')
  end

  def down
  end
end
