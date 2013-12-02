class CreateInsertions < ActiveRecord::Migration

  def up
    create_table :insertions do |t|
      t.references :apartment
      t.boolean :visualized, :default => false
      t.boolean :notified, :default => false
      t.timestamps
    end
    add_column :apartments, :to_be_considered, :boolean, :default => false
  end

  def down
    remove_column :apartments, :to_be_considered
    drop_table :insertions
  end

end
