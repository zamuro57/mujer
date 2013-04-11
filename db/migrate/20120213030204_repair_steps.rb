class RepairSteps < ActiveRecord::Migration
  def up
    rename_column :steps, :article_id, :post_id
  end

  def down
  end
end
